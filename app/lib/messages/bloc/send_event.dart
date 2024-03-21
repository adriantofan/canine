part of 'send_bloc.dart';

@freezed
class SendEvent with _$SendEvent {
  const factory SendEvent.textChanged(String text) = SendEventTextChanged;
  const factory SendEvent.send(
      Future<void> Function(NewMessage msg) sendMessage) = SendEventSend;
}
