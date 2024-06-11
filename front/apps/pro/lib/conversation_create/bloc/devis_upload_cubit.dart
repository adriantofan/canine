import 'package:applib/applib.dart';
import 'package:bloc/bloc.dart';
import 'package:file_selector/file_selector.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'devis_upload_cubit.freezed.dart';
part 'devis_upload_state.dart';

class DevisUploadCubit extends Cubit<DevisUploadState> {
  final SyncRepository _repository;
  DevisUploadCubit(this._repository) : super(const DevisUploadState.form());
  Future<void> requireUploadDialog() async {
    Future.microtask(() => emit(state.copyWith(showFileDialog: true)));
  }

  Future<void> upload() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      final recipient = await _repository.analyseDevis(state.file.value!);
      emit(state.copyWith(
          status: FormzSubmissionStatus.success, recipient: recipient));
    } on APIError catch (e) {
      emit(state.copyWith(
          status: FormzSubmissionStatus.failure, errorMessage: e.message));
    }
  }

  Future<void> didUploadFile(XFile? file) async {
    final fileInput = file != null ? FileInput.dirty(file) : state.file;
    emit(state.copyWith(
        file: fileInput,
        showFileDialog: false,
        isValid: Formz.validate([fileInput])));
  }
}
