import 'package:applib/applib.dart';
import 'package:bloc/bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_create_cubit.freezed.dart';
part 'user_create_state.dart';

class UserCreateCubit extends Cubit<UserCreateState> {
  final SyncRepository _repository;
  UserCreateCubit(this._repository, DevisRecipient recipient)
      : super(UserCreateState.fromRecipient(recipient));

  void firstNameChanged(String value) {
    final firstName = FirstName.dirty(value);
    emit(
      state.copyWith(
        firstName: firstName,
        isValid: Formz.validate(
            [firstName, state.lastName, state.mobile, state.email]),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void lastNameChanged(String value) {
    final lastName = LastName.dirty(value);
    emit(
      state.copyWith(
        lastName: lastName,
        isValid: Formz.validate(
            [state.firstName, lastName, state.mobile, state.email]),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void mobileChanged(String value) {
    final mobile = Mobile.dirty(value);
    emit(
      state.copyWith(
        mobile: mobile,
        isValid: Formz.validate(
            [state.firstName, state.lastName, mobile, state.email]),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate(
            [state.firstName, state.lastName, state.mobile, email]),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  Future<void> createUser() async {
    if (!state.isValid) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      // TODO: add remaining fields
      final user =
          await _repository.createUser(messagingAddress: state.email.value);
      emit(state.copyWith(status: FormzSubmissionStatus.success, user: user));
    } on APIError catch (e) {
      emit(state.copyWith(
          status: FormzSubmissionStatus.failure, errorMessage: e.message));
    }
  }
}
