import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_state.freezed.dart';

// Models sorted list of items with a start and end id and remembers if
// there are more items before the start
@freezed
sealed class ListState<T> with _$ListState {
  const ListState._();

  const factory ListState.unknown() = ListStateUnknown;
  const factory ListState.empty() = ListStateEmpty;
  const factory ListState.cached(
      {required List<T> items,
      required int startId,
      required int endId,
      required bool moreBeforeStart}) = ListStateCached;

  static ListState<T> fromItems<T>(
      List<T> items, int Function(T) idFunc, bool moreBeforeStart) {
    if (items.isEmpty) {
      return const ListStateEmpty();
    }
    return ListState.cached(
        items: items,
        startId: idFunc(items.first),
        endId: idFunc(items.last),
        moreBeforeStart: moreBeforeStart);
  }

  List<T> get items => switch (this) {
        ListStateUnknown() => [],
        ListStateEmpty() => [],
        ListStateCached() => this.items,
      };
  ListState<T> addRight(List<T> items, int Function(T) idFunc) {
    if (items.isEmpty) {
      return this;
    }
    if (this is ListStateCached<T>) {
      return ListState.cached(
          items: items + (this as ListStateCached<T>).items,
          startId: idFunc(items.first),
          endId: (this as ListStateCached<T>).endId,
          moreBeforeStart: (this as ListStateCached<T>).moreBeforeStart);
    }
    return ListState.fromItems(items, idFunc, true);
  }

  ListState<T> addLeft(
      List<T> items, int Function(T) idFunc, bool moreBeforeStart) {
    if (items.isEmpty) {
      return this;
    }
    if (this is ListStateCached<T>) {
      return ListState.cached(
          items: (this as ListStateCached<T>).items + items,
          startId: idFunc(items.last),
          endId: (this as ListStateCached<T>).endId,
          moreBeforeStart: moreBeforeStart);
    }
    return ListState.fromItems(items, idFunc, moreBeforeStart);
  }
}
