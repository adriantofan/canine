import 'dart:async';

import 'package:applib/applib.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;
  final APIClientBase _apiClient;
  final String? loginHint;
  final int? workspaceId;
  StreamSubscription<AuthStatus>? _disposable;

  LoginCubit(this._authRepository, this._apiClient,
      {this.loginHint, this.workspaceId})
      : super(LoginState.initial(onWorkspace: workspaceId != null)) {
    _disposable = _authRepository.authStatusChanges.listen((status) {
      if (status is AuthStatusAuthenticated) {
        emit(state.copyWith(loginStatus: FormzSubmissionStatus.inProgress));
      }
    });
    if (workspaceId != null) {
      loadWorkspace();
    }
  }

  @override
  Future<void> close() {
    _disposable?.cancel();
    return super.close();
  }

  Future<void> create() async {
    emit(state.copyWith(createStatus: FormzSubmissionStatus.inProgress));
    try {
      await _authRepository.login(loginHint: loginHint, createAccount: true);
      // remain in progress state to show loading indicator until app bloc changes state
      emit(state.copyWith(createStatus: FormzSubmissionStatus.inProgress));
    } on APIError catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.userMessage,
          createStatus: FormzSubmissionStatus.failure,
        ),
      );
    } catch (_) {
      emit(state.copyWith(
          createStatus: FormzSubmissionStatus.failure, errorMessage: null));
    }
  }

  Future<void> loadWorkspace() async {
    emit(state.copyWith(workspaceStatus: FormzSubmissionStatus.inProgress));
    try {
      final workspace = await _apiClient.getWorkspace(workspaceId!);
      emit(state.copyWith(
        workspace: workspace,
        workspaceStatus: FormzSubmissionStatus.success,
      ));
    } on APIError catch (e) {
      emit(
        state.copyWith(
          loadErrorMessage: e.userMessage,
          workspaceStatus: FormzSubmissionStatus.failure,
          notFound: e.code == kServerNotFound,
        ),
      );
    }
  }

  Future<void> logIn() async {
    emit(state.copyWith(loginStatus: FormzSubmissionStatus.inProgress));
    try {
      await _authRepository.login(loginHint: loginHint);
      // remain in progress state to show loading indicator until app bloc changes state
      emit(state.copyWith(loginStatus: FormzSubmissionStatus.inProgress));
    } on APIError catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.userMessage,
          loginStatus: FormzSubmissionStatus.failure,
        ),
      );
    } catch (_) {
      emit(state.copyWith(
          loginStatus: FormzSubmissionStatus.failure, errorMessage: null));
    }
  }
}
