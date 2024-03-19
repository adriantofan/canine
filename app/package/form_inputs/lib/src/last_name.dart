import 'package:formz/formz.dart';

class LastName extends FormzInput<String, String> {
  const LastName.pure() : super.pure('');
  const LastName.dirty([String value = '']) : super.dirty(value);

  @override
  String? validator(String? value) {
    return value?.isNotEmpty == true ? null : 'Last name cannot be empty';
  }
}
