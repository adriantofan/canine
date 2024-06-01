part of 'user_create_cubit.dart';

@freezed
class UserCreateState with _$UserCreateState {
  const UserCreateState._();

  const factory UserCreateState.form([
    @Default(FirstName.pure()) FirstName firstName,
    @Default(LastName.pure()) LastName lastName,
    @Default(Mobile.pure()) Mobile mobile,
    @Default(Email.pure()) Email email,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(false) bool isValid,
    @Default(null) User? user,
    String? errorMessage,
  ]) = _Initial;

  factory UserCreateState.fromRecipient(DevisRecipient? recipient) {
    if (recipient == null) {
      return const UserCreateState.form();
    }
    final first = FirstName.dirty(recipient.firstName);
    final last = LastName.dirty(recipient.lastName);
    final mobile = Mobile.dirty(recipient.phone);
    final email = Email.dirty(recipient.email ?? '');

    return UserCreateState.form(
      first,
      last,
      mobile,
      email,
      FormzSubmissionStatus.initial,
      Formz.validate([first, last, mobile, email]),
    );
  }
}
