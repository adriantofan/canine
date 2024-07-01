import 'package:async/async.dart';
import 'package:bloc/bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repository/repository.dart';

part 'verify_phone_cubit.freezed.dart';
part 'verify_phone_state.dart';

const Duration resendDelay = Duration(seconds: 30);

class VerifyPhoneCubit extends Cubit<VerifyPhoneState> {
  DateTime sentAt;
  String token;
  final APIClientBase apiClient;

  VerifyPhoneCubit({
    required this.apiClient,
    required this.token,
    required this.sentAt,
  }) : super(VerifyPhoneState.initial(
          sentAt: sentAt,
        )) {
    delayResend();
  }

  CancelableOperation? refresh;
  void delayResend() {
    refresh?.cancel();
    refresh =
        CancelableOperation.fromFuture(Future.delayed(resendDelay, () {}));
    refresh!.then((p0) => emit(state.copyWith(canResend: true)));
  }

  void codeChanged(String value) {
    final code = Code.dirty(value);
    emit(
      state.copyWith(
        code: code,
        isValid: Formz.validate([
          code,
        ]),
        sendStatus: FormzSubmissionStatus.initial,
        errorMessage: null,
      ),
    );
  }

  Future<void> verify() async {
    emit(state.copyWith(
      sendStatus: FormzSubmissionStatus.inProgress,
      errorMessage: null,
    ));

    try {
      await apiClient.meVerifyPhone(token, state.code.value);
      emit(state.copyWith(
        sendStatus: FormzSubmissionStatus.success,
        errorMessage: null,
      ));
    } on APIError catch (e) {
      if (e.code == kServerInvalidRequest) {
        emit(state.copyWith(
          sendStatus: FormzSubmissionStatus.failure,
          errorMessage: 'Invalid code',
        ));
        return;
      }

      emit(state.copyWith(
        sendStatus: FormzSubmissionStatus.failure,
        errorMessage: e.message,
      ));
    }
  }

  Future<void> resend() async {
    emit(state.copyWith(
      resendCodeStatus: FormzSubmissionStatus.inProgress,
      errorMessage: null,
    ));
    try {
      await apiClient.meResendPhoneCode(token);
      emit(state.copyWith(
        resendCodeStatus: FormzSubmissionStatus.success,
        errorMessage: null,
        canResend: false,
      ));
      delayResend();
    } on APIError catch (e) {
      emit(state.copyWith(
        resendCodeStatus: FormzSubmissionStatus.failure,
        errorMessage: e.message,
      ));
    }
  }

  @override
  Future<void> close() async {
    await refresh?.cancel();
    super.close();
  }
}
