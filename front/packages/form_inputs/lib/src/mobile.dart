import 'package:formz/formz.dart';

class Mobile extends FormzInput<String, String> {
  const Mobile.pure() : super.pure('');
  const Mobile.dirty([String value = '']) : super.dirty(value);

  @override
  String? validator(String? value) {
    if (value == null) {
      return null;
    }
    // error if the number contains something else than digits or plus sign
    if (!RegExp(r'^[0-9+]+$').hasMatch(value)) {
      return 'Mobile can only contain digits and plus sign';
    }

    return null;
  }
}
