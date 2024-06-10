part of 'org_create_cubit.dart';

@freezed
class OrgCreateState with _$OrgCreateState {
  const OrgCreateState._();
  const factory OrgCreateState.initial({
    @Default(OrgName.pure()) OrgName orgName,
    @Default(Email.pure()) Email email,
    @Default(FrenchMobile.pure()) FrenchMobile mobile,
    @Default(FirstName.pure()) FirstName firstName,
    @Default(LastName.pure()) LastName lastName,
    @Default(Password.pure()) Password password,
    @Default(ConfirmedPassword.pure()) ConfirmedPassword confirmedPassword,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(false) bool isValid,
    String? errorMessage,
  }) = _Initial;
}
