part of 're_login_cubit.dart';

@freezed
class ReLoginState with _$ReLoginState {
  const factory ReLoginState.initial(
      [@Default(null) Identity? identity,
      @Default(PasswordSubmit.pure()) PasswordSubmit password,
      @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
      @Default(false) bool isValid,
      String? errorMessage]) = _ReLoginStateInitial;
}
