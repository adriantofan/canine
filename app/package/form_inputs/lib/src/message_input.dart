import 'package:formz/formz.dart';

enum MessageValidationError { empty }

class MessageInput extends FormzInput<String, MessageValidationError> {
  const MessageInput.pure() : super.pure('');
  const MessageInput.dirty([super.value = '']) : super.dirty();

  @override
  MessageValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : MessageValidationError.empty;
  }
}
