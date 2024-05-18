import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repository/repository.dart';

part 'app_bloc.freezed.dart';
part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  int? workspaceId;
  AppBloc() : super(const AppState.starting()) {
    on<StatusChanged>((event, emit) {});
  }

  logout() {}
}
