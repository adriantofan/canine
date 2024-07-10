part of 'search_suggest_bloc.dart';

@freezed
sealed class SearchSuggestEvent with _$SearchSuggestEvent {
  const factory SearchSuggestEvent.started() = SearchSuggestEventStarted;
  const factory SearchSuggestEvent.queryChanged(String query) =
      SearchSuggestEventQueryChanged;
  const factory SearchSuggestEvent.tagChanged(int id) =
      SearchSuggestEventTagChanged;
  const factory SearchSuggestEvent.tagSinceChanged(DateTime since) =
      SearchSuggestEventTagSinceChanged;
}
