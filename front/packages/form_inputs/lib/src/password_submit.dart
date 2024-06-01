import 'package:formz/formz.dart';

/// Validation errors for the [Password] [FormzInput].
enum PasswordSubmitValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template password}
/// Form input for an password input.
/// {@endtemplate}
class PasswordSubmit extends FormzInput<String, PasswordSubmitValidationError> {
  /// {@macro password}
  const PasswordSubmit.pure() : super.pure('');

  /// {@macro password}
  const PasswordSubmit.dirty([super.value = '']) : super.dirty();

  @override
  PasswordSubmitValidationError? validator(String? value) {
    return value?.isNotEmpty == true
        ? value!.length > 5
            ? null
            : PasswordSubmitValidationError.invalid
        : PasswordSubmitValidationError.invalid;
  }
}
