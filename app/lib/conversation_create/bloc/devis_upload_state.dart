part of 'devis_upload_cubit.dart';

@freezed
class DevisUploadState with _$DevisUploadState {
  const factory DevisUploadState.form([
    @Default(false) showFileDialog,
    @Default(FileInput.pure()) FileInput file,
    @Default(null) DevisRecipient? recipient,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(false) bool isValid,
    String? errorMessage,
  ]) = DevisUploadStateForm;
}
