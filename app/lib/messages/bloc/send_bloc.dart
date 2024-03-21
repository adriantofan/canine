import 'package:bloc/bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../model/draft_message.dart';

part 'send_bloc.freezed.dart';
part 'send_event.dart';
part 'send_state.dart';

class SendBloc extends Bloc<SendEvent, SendState> {
  SendBloc() : super(SendState(const Uuid().v4())) {
    on<SendEventTextChanged>(_onTextChanged);
    on<SendEventSend>(_onSend);
  }

  void _onSend(SendEventSend event, Emitter<SendState> emit) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final msg = DraftMessage(
      text: state.message.value,
      idempotencyId: state.idempotencyId,
      attachment: null,
    );

    await event
        .sendMessage(msg)
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

  void _onTextChanged(SendEventTextChanged event, Emitter<SendState> emit) {
    final message = MessageInput.dirty(event.text);
    emit(state.copyWith(
      message: message,
      isValid: message.isValid,
      status: FormzSubmissionStatus.initial,
    ));
  }
}
