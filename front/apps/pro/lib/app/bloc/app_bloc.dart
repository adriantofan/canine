import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repository/repository.dart';

part 'app_bloc.freezed.dart';
part 'app_event.dart';

class AppBloc extends Bloc<AppEvent, AuthStatus> {
  final AuthRepository _authRepository;

  int? get _workspaceId => _authRepository.workspaceId;
  bool get isAuthenticated => _authRepository.isAuthenticated;

  AppBloc(this._authRepository) : super(const AuthStatus.unknown()) {
    on<AppEventInitial>((event, emit) async {
      await emit.forEach(_authRepository.authStatusStream,
          onData: (status) => status);
    });
  }

  logout() {}
  int? get workspaceId => _workspaceId;
}
