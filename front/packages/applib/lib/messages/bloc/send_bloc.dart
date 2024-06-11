import 'package:bloc/bloc.dart';
import 'package:file_selector/file_selector.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:uuid/uuid.dart';

import '../model/draft_message.dart';

part 'send_bloc.freezed.dart';
part 'send_event.dart';
part 'send_state.dart';

class SendBloc extends Bloc<SendEvent, SendState> {
  final _log = Logger('SendBloc');
  final Future<void> Function(DraftMessage msg) sendMessage;
  SendBloc(DraftMessage? message, this.sendMessage)
      : super(SendState.fromMessage(message)) {
    on<SendEventTextChanged>(_onTextChanged);
    on<SendEventSend>(_onSend);
    on<SendEventAttachmentAdded>(_onAttachmentAdded);
    on<SendEventAttachmentRemoved>(_onAttachmentRemoved);
  }

  void _onAttachmentAdded(
      SendEventAttachmentAdded event, Emitter<SendState> emit) async {
    emit(state.copyWith(
      attachments: state.attachments + [event.attachment],
    ));
  }

  void _onAttachmentRemoved(
      SendEventAttachmentRemoved event, Emitter<SendState> emit) async {
    final newAttachments = List<XFile>.from(state.attachments);
    newAttachments.removeAt(event.index);
    emit(state.copyWith(
      attachments: newAttachments,
    ));
  }

  void _onSend(SendEventSend event, Emitter<SendState> emit) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final msg = DraftMessage(
      text: state.message.value,
      idempotencyId: state.idempotencyId,
      attachments: state.attachments,
      // This might create a conversation first, so we need to know to take over from here
      sending: true,
    );

    await sendMessage(msg)
        .then((value) => (emit.isDone)
            ? null
            : emit(state.copyWith(
                status: FormzSubmissionStatus.success,
                message: const MessageInput.pure(),
                attachments: [],
                idempotencyId: const Uuid()
                    .v4(), // new idempotency id after successful send
                isValid: false,
              )))
        .catchError((e) {
      (emit.isDone)
          ? _log.warning('Failed to send message', e)
          : emit(state.copyWith(
              status: FormzSubmissionStatus.failure,
            ));
    });
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
