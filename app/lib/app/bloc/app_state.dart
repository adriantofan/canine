part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  const factory AppState(
      {@Default(AuthenticationStatus.unknown)
      AuthenticationStatus status}) = _AppState;
}
