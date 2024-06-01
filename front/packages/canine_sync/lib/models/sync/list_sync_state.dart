import 'package:freezed_annotation/freezed_annotation.dart';

import '../../cache/model/models.dart';
import 'remote_data_status.dart';

part 'list_sync_state.freezed.dart';

@freezed
class ListSyncState with _$ListSyncState {
  const factory ListSyncState(RemoteDataStatus startStatus) = _ListSyncState;
  static ListSyncState fromCacheListState(ListState state) {
    switch (state) {
      case ListStateUnknown():
        return const ListSyncState(RemoteDataStatus.undetermined());
      case ListStateEmpty():
        // there is nothing to load more when empty
        return const ListSyncState(RemoteDataStatus.complete());
      case ListStateCached():
        if (state.moreBeforeStart) {
          return const ListSyncState(RemoteDataStatus.undetermined());
        }
        return const ListSyncState(RemoteDataStatus.complete());
    }
  }
}
