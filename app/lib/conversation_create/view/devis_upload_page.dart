import 'package:app/conversation_create/bloc/devis_upload_cubit.dart';
import 'package:app/repository/repository.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../bloc/create_flow_bloc.dart';

class DevisUploadPage extends StatelessWidget {
  const DevisUploadPage({super.key});

  static Page<void> page() => MaterialPage<void>(
          child: BlocProvider(
        create: (context) => DevisUploadCubit(context.read<SyncRepository>())
          ..requireUploadDialog(),
        child: const DevisUploadPage(),
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upload devis')),
      body: BlocConsumer<DevisUploadCubit, DevisUploadState>(
        listener: (context, state) async {
          // TODO: This requires a future.microtask to work when the initial state is generated, clarify why
          if (state.showFileDialog) {
            final file = await _showUploadDialog(context);
            if (file != null && context.mounted) {
              context.read<DevisUploadCubit>().didUploadFile(file);
            }
            return;
          }
          if (state.status.isFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage ?? 'Analyse Failure'),
                ),
              );
          }
          if (state.status.isSuccess) {
            context.read<CreateFlowBloc>().add(CreateFlowEvent.devisUploaded(
                state.file.value!, state.recipient!));
          }
        },
        builder: (context, state) {
          return PopScope(
            canPop: !state.status.isInProgress,
            child: Align(
              alignment: const Alignment(0, -1 / 3),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 16),
                    _FileInput(),
                    const SizedBox(height: 8),
                    _ChoseFileButton(),
                    const SizedBox(height: 4),
                    _UploadButton(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<XFile?> _showUploadDialog(BuildContext context) async {
    const XTypeGroup typeGroup = XTypeGroup(
      label: 'pdf documents',
      extensions: <String>['pdf'],
    );
    return openFile(acceptedTypeGroups: <XTypeGroup>[typeGroup]);
  }
}

class _FileInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DevisUploadCubit, DevisUploadState>(
      buildWhen: (previous, current) => previous.file != current.file,
      builder: (context, state) {
        return Text(
          state.file.value?.name ?? 'No file selected',
          key: const Key('devisUploadForm_fileInput_textField'),
        );
      },
    );
  }
}

class _UploadButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DevisUploadCubit, DevisUploadState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const SizedBox(
                width: 20, height: 20, child: CircularProgressIndicator())
            : ElevatedButton(
                key: const Key('devisUploadForm_uploadButton_elevatedButton'),
                onPressed: state.isValid
                    ? () {
                        context.read<DevisUploadCubit>().upload();
                      }
                    : null,
                child: const Text('Upload'),
              );
      },
    );
  }
}

class _ChoseFileButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DevisUploadCubit, DevisUploadState>(
      builder: (context, state) {
        return ElevatedButton(
          key: const Key('devisUploadForm_choseFileButton_elevatedButton'),
          onPressed: state.status.isInProgress
              ? null
              : () {
                  context.read<DevisUploadCubit>().requireUploadDialog();
                },
          child: const Text('Chose file'),
        );
      },
    );
  }
}
