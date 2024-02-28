import 'package:bloc/bloc.dart';
import 'package:canine_sync/canine_sync.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repository/repository.dart';

part 'app_bloc.freezed.dart';
part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  SyncRepository _syncRepository;
  AppBloc(this._syncRepository) : super(const AppState()) {
    on<_StatusChanged>((event, emit) {
      emit(AppState(status: event.status));
    });

    _syncRepository.authStatus.listen((status) {
      add(AppEvent._statusChanged(status));
    });
  }
}
