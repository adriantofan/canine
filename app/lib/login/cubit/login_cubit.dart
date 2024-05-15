import 'package:bloc/bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repository/repository.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final SyncRepository _syncRepository;

  LoginCubit(this._syncRepository, String workspaceId)
      : super(const LoginState.initial(
            workspaceId: WorkspaceId.dirty("1714116660140")));

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email, state.password, state.workspaceId]),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void passwordChanged(String value) {
    final password = PasswordSubmit.dirty(value);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([state.email, password, state.workspaceId]),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void workspaceIdChanged(String value) {
    final workspaceId = WorkspaceId.dirty(value);
    emit(
      state.copyWith(
        workspaceId: workspaceId,
        isValid: Formz.validate([state.email, state.password, workspaceId]),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  Future<void> logInWithCredentials() async {
    if (!state.isValid) return;
    final workspaceId = int.tryParse(state.workspaceId.value);
    if (workspaceId == null) {
      emit(state.copyWith(
          status: FormzSubmissionStatus.failure,
          errorMessage: 'Invalid workspace ID'));
      return;
    }
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _syncRepository.login(
        workspaceId,
        state.email.value,
        state.password.value,
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on APIError catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.userMessage,
          status: FormzSubmissionStatus.failure,
        ),
      );
    } catch (_) {
      emit(state.copyWith(
          status: FormzSubmissionStatus.failure, errorMessage: null));
    }
  }
}
