part of 'send_message_bloc.dart';

@freezed
class SendMessageEvent with _$SendMessageEvent {
  const factory SendMessageEvent.textChanged(String text) =
      SendMessageEventTextChanged;
  const factory SendMessageEvent.send() = SendMessageEventSend;
}
