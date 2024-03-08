import 'package:freezed_annotation/freezed_annotation.dart';

import 'remote_data_status.dart';

part 'history.freezed.dart';

@freezed
class HistoryState with _$HistoryState {
  const factory HistoryState(int startId, RemoteDataStatus startStatus) =
      _HistoryState;
}
