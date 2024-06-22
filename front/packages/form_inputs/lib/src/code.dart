import 'package:formz/formz.dart';

enum CodeValidationError {
  /// Generic invalid error.
  invalid
}

class Code extends FormzInput<String, CodeValidationError> {
  const Code.pure() : super.pure('');
  const Code.dirty([super.value = '']) : super.dirty();

  static final RegExp _workspaceRegExp = RegExp(
    r'^[A-Za-z0-9]{4,6}$',
  );

  @override
  CodeValidationError? validator(String? value) {
    return _workspaceRegExp.hasMatch(value ?? '')
        ? null
        : CodeValidationError.invalid;
  }
}
