import 'package:bloc/bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repository/repository.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit(this._authRepository) : super(const LoginState.initial());

  Future<void> logIn() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _authRepository.login();
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
