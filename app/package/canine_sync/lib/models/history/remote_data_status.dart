import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_data_status.freezed.dart';

@freezed
sealed class RemoteDataStatus with _$RemoteDataStatus {
  const factory RemoteDataStatus.undetermined() = RemoteDataStatusUndetermined;
  const factory RemoteDataStatus.complete() = RemoteDataStatusComplete;
  const factory RemoteDataStatus.loading() = RemoteDataStatusLoading;
  const factory RemoteDataStatus.failed() = RemoteDataStatusFailed;
}

extension UndeterminedEvents on RemoteDataStatusUndetermined {
  RemoteDataStatusLoading get load => const RemoteDataStatusLoading();
}

extension LoadingEvents on RemoteDataStatusLoading {
  RemoteDataStatusComplete get complete => const RemoteDataStatusComplete();
  RemoteDataStatusUndetermined get loaded =>
      const RemoteDataStatusUndetermined();
  RemoteDataStatusFailed get failed => const RemoteDataStatusFailed();
}

extension FailedEvents on RemoteDataStatusFailed {
  RemoteDataStatusLoading get retry => const RemoteDataStatusLoading();
}
