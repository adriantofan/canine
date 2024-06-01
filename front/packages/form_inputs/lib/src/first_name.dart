import 'package:formz/formz.dart';

class FirstName extends FormzInput<String, String> {
  const FirstName.pure() : super.pure('');
  const FirstName.dirty([String value = '']) : super.dirty(value);

  @override
  String? validator(String? value) {
    return value?.isNotEmpty == true ? null : 'First name cannot be empty';
  }
}
