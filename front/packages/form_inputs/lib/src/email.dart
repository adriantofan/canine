import 'package:formz/formz.dart';

/// Validation errors for the [Email] [FormzInput].
enum EmailValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template email}
/// Form input for an email input.
/// {@endtemplate}
class Email extends FormzInput<String, String> {
  /// {@macro email}
  const Email.pure() : super.pure('');

  /// {@macro email}
  const Email.dirty([super.value = '']) : super.dirty();

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  String? validator(String? value) {
    if (_emailRegExp.hasMatch(value ?? '')) {
      return null;
    }
    return value?.isEmpty ?? true ? "Email is empty" : "Invalid email address";
  }
}
