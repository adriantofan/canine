import 'package:applib/applib.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;
  final String? loginHint;

  var disposable;
  LoginCubit(this._authRepository, {this.loginHint})
      : super(const LoginState.initial()) {
    disposable = _authRepository.authStatusChanges.listen((status) {
      if (status is AuthStatusAuthenticated) {
        emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      }
    });
  }

  @override
  Future<void> close() {
    disposable.cancel();
    return super.close();
  }

  Future<void> logIn() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _authRepository.login(loginHint: loginHint);
      // remain in progress state to show loading indicator until app bloc changes state
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
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
