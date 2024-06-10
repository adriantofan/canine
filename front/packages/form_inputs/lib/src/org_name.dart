import 'package:formz/formz.dart';

class OrgName extends FormzInput<String, String> {
  const OrgName.pure() : super.pure('');
  const OrgName.dirty([super.value = '']) : super.dirty();

  @override
  String? validator(String? value) {
    return value?.isNotEmpty == true ? null : 'Organisation name required';
  }
}
