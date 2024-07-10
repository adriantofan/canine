part of 'search_suggest_bloc.dart';

@freezed
class SearchSuggestState with _$SearchSuggestState {
  const factory SearchSuggestState({
    required SearchQuery query,
  }) = _SearchSuggestState;
}
