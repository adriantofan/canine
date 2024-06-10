import 'package:dlibphonenumber/dlibphonenumber.dart';
import 'package:formz/formz.dart';

class FrenchMobile extends FormzInput<String, String> {
  const FrenchMobile.pure() : super.pure('');
  const FrenchMobile.dirty([String value = '']) : super.dirty(value);

  @override
  String? validator(String? value) {
    if (value == null) {
      return null;
    }
    PhoneNumberUtil phoneUtil = PhoneNumberUtil.instance;
    try {
      PhoneNumber frenchNumber = phoneUtil.parse(value, "FR");
      if (frenchNumber.countryCode != 33) {
        return "Expected French mobile number.";
      }
      if (frenchNumber.nationalNumber.toString().length != 9) {
        return "Expected French mobile number.";
      }
    } on NumberParseException catch (e) {
      return "Expected French mobile number.";
    }
    return null;
  }

  static String format(String value) {
    PhoneNumberUtil phoneUtil = PhoneNumberUtil.instance;
    try {
      PhoneNumber frenchNumber = phoneUtil.parse(value, "FR");
      return phoneUtil.format(frenchNumber, PhoneNumberFormat.national);
    } on NumberParseException catch (e) {
      return "NumberParseException was thrown: ${e.toString()}";
    }
  }

  String formate164() {
    PhoneNumberUtil phoneUtil = PhoneNumberUtil.instance;
    PhoneNumber frenchNumber = phoneUtil.parse(value, "FR");
    return phoneUtil.format(frenchNumber, PhoneNumberFormat.e164);
  }
}
