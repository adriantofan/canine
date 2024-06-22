part of 'link_bloc.dart';

@freezed
class LinkState with _$LinkState {
  const factory LinkState({
    EndUserAuthorization? authorization,
    required FormzSubmissionStatus authorizationCheckStatus,
    String? errorMessage,
    // A new phone was added to the user account, so we need to redo the flow
    @Default(false) bool didValidate,
  }) = _LinkState;
}
