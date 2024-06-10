import 'package:bloc/bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repository/repository.dart';

part 'create_state.dart';
part 'org_create_cubit.freezed.dart';

class OrgCreateCubit extends Cubit<OrgCreateState> {
  final APIClientBase _apiClient;
  OrgCreateCubit(this._apiClient) : super(const OrgCreateState.initial());

  void orgNameChanged(String value) {
    final orgName = OrgName.dirty(value);
    emit(
      state.copyWith(
        orgName: orgName,
        isValid: Formz.validate([
          orgName,
          state.email,
          state.mobile,
          state.firstName,
          state.lastName,
          state.password,
          state.confirmedPassword
        ]),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([
          state.orgName,
          email,
          state.mobile,
          state.firstName,
          state.lastName,
          state.password,
          state.confirmedPassword
        ]),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void mobileChanged(String value) {
    final mobile = FrenchMobile.dirty(value);
    emit(
      state.copyWith(
        mobile: mobile,
        isValid: Formz.validate([
          state.orgName,
          state.email,
          mobile,
          state.firstName,
          state.lastName,
          state.password,
          state.confirmedPassword
        ]),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void firstNameChanged(String value) {
    final firstName = FirstName.dirty(value);
    emit(
      state.copyWith(
        firstName: firstName,
        isValid: Formz.validate([
          state.orgName,
          state.email,
          state.mobile,
          firstName,
          state.lastName,
          state.password,
          state.confirmedPassword
        ]),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void lastNameChanged(String value) {
    final lastName = LastName.dirty(value);
    emit(
      state.copyWith(
        lastName: lastName,
        isValid: Formz.validate([
          state.orgName,
          state.email,
          state.mobile,
          state.firstName,
          lastName,
          state.password,
          state.confirmedPassword
        ]),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    final confirmedPassword = ConfirmedPassword.dirty(
      password: value,
      value: state.confirmedPassword.value,
    );
    emit(
      state.copyWith(
        password: password,
        confirmedPassword: confirmedPassword,
        isValid: Formz.validate([
          state.orgName,
          state.email,
          state.mobile,
          state.firstName,
          state.lastName,
          password,
          confirmedPassword
        ]),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void confirmPasswordChanged(String value) {
    final confirmedPassword = ConfirmedPassword.dirty(
      password: state.password.value,
      value: value,
    );
    emit(
      state.copyWith(
        confirmedPassword: confirmedPassword,
        isValid: Formz.validate([
          state.orgName,
          state.email,
          state.mobile,
          state.firstName,
          state.lastName,
          state.password,
          confirmedPassword
        ]),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  Future<void> createOrg() async {
    final isValid = Formz.validate([
      state.orgName,
      state.email,
      state.mobile,
      state.firstName,
      state.lastName,
      state.password,
      state.confirmedPassword
    ]);

    if (state.isValid != isValid) {
      emit(state.copyWith(isValid: isValid));
      return;
    }

    if (!state.isValid) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    OrgCreatePayload payload = OrgCreatePayload(
      name: state.orgName.value,
      email: state.email.value,
      phone: state.mobile.formate164(),
      firstName: state.firstName.value,
      lastName: state.lastName.value,
      password: state.password.value,
    );
    try {
      await _apiClient.createOrg(payload);
    } on APIError catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.userMessage,
          status: FormzSubmissionStatus.failure,
        ),
      );
      return;
    }

    emit(state.copyWith(
        status: FormzSubmissionStatus.success, errorMessage: null));
  }
}
