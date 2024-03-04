import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repository/repository.dart';

part 'app_bloc.freezed.dart';
part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  SyncRepository _syncRepository;
  AppBloc(this._syncRepository) : super(const AppState.unknown()) {
    on<StatusChanged>((event, emit) {
      final status = event.status;
      switch (status) {
        case AuthenticationStatusUnknown():
          emit(const AppState.unknown());
        case AuthenticationStatusAuthenticated(identity: Identity()):
          emit(AppState.running(status.identity));
        case AuthenticationStatusUnauthenticated(identity: var identity):
          if (identity == null) {
            emit(const AppState.loginRegisterFlow());
            return;
          }
          if (state is Running) {
            emit(AppState.runningRefresh(identity));
          } else {
            emit(AppState.login(identity));
          }
      }
    });
    on<Logout>((event, emit) {
      switch (state) {
        case Login():
        case Running():
        case RunningRefresh():
          emit(const AppState.loggingOut());
        default:
      }
    });

    _syncRepository.authStatus.listen((status) {
      add(AppEvent.statusChanged(status));
    });
  }

  logout() {
    add(const AppEvent.logout());
  }
}
