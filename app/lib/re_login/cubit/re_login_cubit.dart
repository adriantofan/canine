import 'package:bloc/bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repository/repository.dart';

part 're_login_cubit.freezed.dart';
part 're_login_state.dart';

class ReLoginCubit extends Cubit<ReLoginState> {
  final SyncRepository _syncRepository;

  ReLoginCubit(this._syncRepository) : super(const ReLoginState.initial()) {
    _syncRepository.authStatus
        .firstWhere((status) =>
            status is AuthenticationStatusUnauthenticated &&
            status.identity != null)
        .then((status) {
      emit(state.copyWith(
          identity: (status as AuthenticationStatusUnauthenticated).identity!));
    });
  }

  void passwordChanged(String value) {
    final password = PasswordSubmit.dirty(value);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([state.password]),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  Future<void> logInWithCredentials() async {
    if (!state.isValid) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _syncRepository.login(
        state.identity!.workspaceId,
        state.identity!.username,
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
