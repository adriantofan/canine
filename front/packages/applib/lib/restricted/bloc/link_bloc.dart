import 'package:applib/applib.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'link_bloc.freezed.dart';
part 'link_event.dart';
part 'link_state.dart';

class LinkBloc extends Bloc<LinkEvent, LinkState> {
  APIClientBase _apiClient;
  int _workspaceId;
  int _conversationId;
  String _token;

  LinkBloc(
      this._apiClient, this._workspaceId, this._conversationId, this._token)
      : super(const LinkState(
          authorizationCheckStatus: FormzSubmissionStatus.initial,
        )) {
    on<LinkEventStarted>((event, emit) async {
      await callAuthzCheck(emit);
    });
    on<LinkEventAuthzCheck>((event, emit) async {
      await callAuthzCheck(emit);
    });
    on<LinkEventDidValidate>((event, emit) async {
      await _eventDidValidate(event, emit);
    });
  }

  Future<void> _eventDidValidate(
      LinkEventDidValidate event, Emitter<LinkState> emit) async {
    if (event.success) {
      emit(state.copyWith(
          authorizationCheckStatus: FormzSubmissionStatus.success,
          errorMessage: null,
          didValidate: true,
          authorization: null));
      await callAuthzCheck(emit);
    } else {
      emit(state.copyWith(
        authorizationCheckStatus: FormzSubmissionStatus.failure,
        errorMessage: 'Failed to verify phone number',
        didValidate: true,
        authorization: null,
      ));
    }
  }

  Future<void> callAuthzCheck(Emitter<LinkState> emit) async {
    emit(state.copyWith(
        authorizationCheckStatus: FormzSubmissionStatus.inProgress,
        errorMessage: null,
        didValidate: false));
    try {
      final result =
          await _apiClient.authzCheck(_token, _workspaceId, _conversationId);
      emit(state.copyWith(
          authorization: result,
          authorizationCheckStatus: FormzSubmissionStatus.success,
          didValidate: false));
    } on APIError catch (error) {
      emit(state.copyWith(
          authorizationCheckStatus: FormzSubmissionStatus.failure,
          errorMessage: error.userMessage,
          authorization: null,
          didValidate: false));
    }
  }
}
