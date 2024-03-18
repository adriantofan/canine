import 'package:file_selector/file_selector.dart';
import 'package:formz/formz.dart';

enum FileInputValidationError { invalid }

class FileInput extends FormzInput<XFile?, FileInputValidationError> {
  const FileInput.pure() : super.pure(null);
  const FileInput.dirty([super.value]) : super.dirty();

  @override
  FileInputValidationError? validator(XFile? value) {
    return value != null ? null : FileInputValidationError.invalid;
  }
}
