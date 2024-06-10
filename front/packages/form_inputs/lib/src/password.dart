import 'package:formz/formz.dart';

/// {@template password}
/// Form input for an password input.
/// {@endtemplate}
class Password extends FormzInput<String, String> {
  /// {@macro password}
  const Password.pure() : super.pure('');

  /// {@macro password}
  const Password.dirty([super.value = '']) : super.dirty();

  @override
  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    if (value.length < 8) {
      return "Password must be at least 8 characters long";
    }

    // must include a symbol
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return "Password must include a symbol of !@#\$%^&*(),.?\":{}|<>";
    }
    //must include a number
    if (!value.contains(RegExp(r'[0-9]'))) {
      return "Password must include a number";
    }

    //must include a lower case letter
    if (!value.contains(RegExp(r'[a-z]'))) {
      return "Password must include a lower case letter";
    }
    //must include an upper case letter
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return "Password must include an upper case letter";
    }
    return null;
  }
}
