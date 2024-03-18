import 'package:bloc/bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../repository/repository.dart';

part 'send_message_bloc.freezed.dart';
part 'send_message_event.dart';
part 'send_message_state.dart';

class SendMessageBloc extends Bloc<SendMessageEvent, SendMessageState> {
  final SyncRepository _syncRepository;

  SendMessageBloc(this._syncRepository, int conversationId)
      : super(SendMessageState(conversationId, const Uuid().v4())) {
    on<SendMessageEventTextChanged>(_onTextChanged);
    on<SendMessageEventSend>(_onSend);
  }

  void _onSend(
      SendMessageEventSend event, Emitter<SendMessageState> emit) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    await _syncRepository
        .createMessage(
            state.conversationId, state.message.value, state.idempotencyId)
        .then((value) => emit(state.copyWith(
              status: FormzSubmissionStatus.success,
              message: const MessageInput.pure(),
              idempotencyId:
                  const Uuid().v4(), // new idempotency id after successful send
              isValid: false,
            )))
        .catchError((e) => emit(state.copyWith(
              status: FormzSubmissionStatus.failure,
            )));
  }

  void _onTextChanged(
      SendMessageEventTextChanged event, Emitter<SendMessageState> emit) {
    final message = MessageInput.dirty(event.text);
    emit(state.copyWith(
      message: message,
      isValid: message.isValid,
      status: FormzSubmissionStatus.initial,
    ));
  }
}
