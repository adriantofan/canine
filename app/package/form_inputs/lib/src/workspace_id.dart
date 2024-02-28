import 'package:formz/formz.dart';

enum WorkspaceIdValidationError {
  /// Generic invalid error.
  invalid
}

class WorkspaceId extends FormzInput<String, WorkspaceIdValidationError> {
  const WorkspaceId.pure() : super.pure('');
  const WorkspaceId.dirty([super.value = '']) : super.dirty();

  static final RegExp _workspaceRegExp = RegExp(
    r'^[0-9.]{13}$',
  );

  @override
  WorkspaceIdValidationError? validator(String? value) {
    return _workspaceRegExp.hasMatch(value ?? '')
        ? null
        : WorkspaceIdValidationError.invalid;
  }
}
