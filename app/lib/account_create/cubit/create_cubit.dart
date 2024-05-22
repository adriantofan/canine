import 'package:bloc/bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repository/repository.dart';

part 'create_cubit.freezed.dart';
part 'create_state.dart';

class CreateCubit extends Cubit<CreateState> {
  final AuthRepository _authRepository;
  final int _workspaceId;
  CreateCubit(this._authRepository, this._workspaceId)
      : super(CreateState.initial(
            workspaceId: WorkspaceId.dirty('$_workspaceId')));

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

  Future<void> createUserWithCredentials() async {
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
      await _authRepository.signUp(
          workspaceId: workspaceId,
          email: state.email.value,
          password: state.password.value);

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
