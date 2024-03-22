import 'package:app/messages/bloc/send_bloc.dart';
import 'package:app/messages/model/draft_message.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';

class SendWidget extends StatelessWidget {
  final Future<void> Function(DraftMessage msg) sendMessage;
  final DraftMessage? message;
  const SendWidget(this.message, this.sendMessage, {super.key});
  // TODO: tomonrow:
  // 1. make sure draft message is used
  // 2. deal with errors
  // 2. try to invoke send when required (coming from create)
  // 3. see about completing the repository and removing the mock
  // 4. there is a pagination problem :-(

  @override
  Widget build(BuildContext context) {
    return _SendField(message, sendMessage);
  }
}

class _SendField extends StatefulWidget {
  final DraftMessage? message;
  final Future<void> Function(DraftMessage msg) sendMessage;

  _SendField(this.message, this.sendMessage) : super(key: ValueKey(message));

  @override
  State<_SendField> createState() => _SendFieldState();
}

class _SendFieldState extends State<_SendField> {
  late final TextEditingController _inputController;
  late final SendBloc _sendBloc;

  @override
  void initState() {
    super.initState();
    _sendBloc = SendBloc(widget.message, widget.sendMessage);
    _inputController = TextEditingController();
    _inputController.text = widget.message?.text ?? '';
    _inputController.addListener(() {
      _sendBloc.add(
        SendEvent.textChanged(_inputController.text),
      );
    });

    if (_sendBloc.state.status == FormzSubmissionStatus.inProgress) {
      // TODO: this needs to be tested
      _sendBloc.add(const SendEvent.send());
    }
  }

  @override
  void dispose() {
    _sendBloc.close();
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return SafeArea(
      bottom: true,
      child: Container(
        constraints: const BoxConstraints(minHeight: 48),
        width: double.infinity,
        decoration: BoxDecoration(
          border: const Border(
            top: BorderSide(
              color: Color(0xFFE5E5EA),
            ),
          ),
          color: themeData.colorScheme.onInverseSurface,
        ),
        child: BlocProvider.value(
          value: _sendBloc,
          child: BlocConsumer<SendBloc, SendState>(
            buildWhen: (previous, current) => previous != current,
            listener: (context, state) {
              if (state.status == FormzSubmissionStatus.success) {
                _inputController.clear();
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  FileChips(),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      TextField(
                        minLines: 1,
                        maxLines: 4,
                        textAlignVertical: TextAlignVertical.top,
                        controller: _inputController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.only(
                            right: 42,
                            left: 42,
                            top: 18,
                          ),
                          hintText: 'message',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          left: 0,
                          // have a look here for alternative https://littleironical.medium.com/custom-popupmenu-in-flutter-ebb36d23a52c
                          child: buildAddButton(context)),
                      // custom suffix btn
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: buildSendButton(state, context),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  IconButton buildSendButton(SendState state, BuildContext context) {
    return IconButton(
      icon: state.status == FormzSubmissionStatus.inProgress
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(),
            )
          : SvgPicture.asset(
              "assets/icons/send.svg",
              // colorFilter: ColorFilter.mode(
              //   context.select<ChatController, bool>(
              //           (value) => value.isTextFieldEnable)
              //       ? const Color(0xFF007AFF)
              //       : const Color(0xFFBDBDC2),
              //   BlendMode.srcIn,
              // ),
            ),
      onPressed:
          state.isValid && state.status != FormzSubmissionStatus.inProgress
              ? () {
                  context.read<SendBloc>().add(
                        const SendEvent.send(),
                      );
                }
              : null, //context.read<ChatController>().onFieldSubmitted,
    );
  }

  PopupMenuButton<AddMenuItemType> buildAddButton(BuildContext context) {
    return PopupMenuButton<AddMenuItemType>(
      icon: const Icon(Icons.add),
      onSelected: (AddMenuItemType value) async {
        final file = await _showUploadDialog(context, value);
        if (file != null && context.mounted) {
          context.read<SendBloc>().add(SendEvent.attachmentAdded(file));
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<AddMenuItemType>>[
        const PopupMenuItem<AddMenuItemType>(
          value: AddMenuItemType.pdf,
          child: Text('Add pdf'),
        ),
        const PopupMenuItem<AddMenuItemType>(
          value: AddMenuItemType.image,
          child: Text('Add image'),
        ),
      ],
    );
  }

  Future<XFile?> _showUploadDialog(
      BuildContext context, AddMenuItemType value) async {
    XTypeGroup typeGroup = switch (value) {
      AddMenuItemType.pdf => const XTypeGroup(
          label: 'pdf documents',
          extensions: <String>['pdf'],
        ),
      AddMenuItemType.image => const XTypeGroup(
          label: 'images',
          extensions: <String>['jpg', 'jpeg', 'png', 'tiff'],
        ),
    };
    return openFile(acceptedTypeGroups: <XTypeGroup>[typeGroup]);
  }
}

class FileChips extends StatelessWidget {
  const FileChips({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SendBloc, SendState, List<XFile?>>(
      selector: (state) => state.attachments,
      builder: (context, files) {
        if (files.isEmpty) {
          return const SizedBox.shrink();
        }
        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
              child: Wrap(
                alignment: WrapAlignment.start,
                spacing: 5.0,
                runSpacing: 5.0,
                children: List<Widget>.generate(
                  files.length,
                  (int index) {
                    return InputChip(
                      label: Text(files[index]?.name ?? 'file $index'),
                      // selected: selectedIndex == index,
                      onSelected: null,
                      onDeleted: () => context
                          .read<SendBloc>()
                          .add(SendEvent.attachmentRemoved(index)),
                    );
                  },
                ).toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}

enum AddMenuItemType { pdf, image }
