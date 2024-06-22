import 'package:applib/applib.dart';
import 'package:bloc/bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'confirm_phone_cubit.freezed.dart';
part 'confirm_phone_state.dart';

class ConfirmPhoneCubit extends Cubit<ConfirmPhoneState> {
  final String phoneHint;
  final APIClientBase apiClient;
  final String token;
  final int workspaceId, conversationId;

  ConfirmPhoneCubit({
    required this.apiClient,
    required this.token,
    required this.workspaceId,
    required this.conversationId,
    required this.phoneHint,
  }) : super(const ConfirmPhoneState.initial());

  void mobileChanged(String value) {
    final mobile = FrenchMobile.dirty(value);
    emit(
      state.copyWith(
        mobile: mobile,
        isValid: Formz.validate([
          mobile,
        ]),
        status: FormzSubmissionStatus.initial,
        errorMessage: null,
      ),
    );
  }

  Future<void> updateMobile() async {
    if (!checkMobile()) {
      emit(state.copyWith(
        isValid: false,
        errorMessage:
            'Your mobile does not match the hinted phone on your doctor\'s file',
      ));
      return;
    }
    emit(state.copyWith(
      status: FormzSubmissionStatus.inProgress,
      errorMessage: null,
    ));
    try {
      await apiClient.meUpdatePhone(
          token, workspaceId, conversationId, state.mobile.formate164());
      emit(state.copyWith(
        status: FormzSubmissionStatus.success,
        errorMessage: null,
      ));
    } on APIError catch (e) {
      emit(state.copyWith(
        status: FormzSubmissionStatus.failure,
        errorMessage: e.userMessage,
      ));
    }
  }

  bool checkMobile() {
    final actual = state.mobile.formate164();
    if (actual.length != phoneHint.length || phoneHint.length != 12) {
      return false;
    }
    if (actual.substring(0, 4) != phoneHint.substring(0, 4)) {
      return false;
    }
    return actual.substring(10, 12) == phoneHint.substring(10, 12);
  }
}
