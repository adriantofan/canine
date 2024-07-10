import 'package:applib/applib.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_suggest_bloc.freezed.dart';
part 'search_suggest_event.dart';
part 'search_suggest_state.dart';

class SearchSuggestBloc extends Bloc<SearchSuggestEvent, SearchSuggestState> {
  final SyncSessionRepository _repository;
  SearchSuggestBloc(this._repository)
      : super(const SearchSuggestState(query: SearchQuery())) {
    on<SearchSuggestEventStarted>((event, emit) {});
    on<SearchSuggestEventQueryChanged>(_queryChanged);
    on<SearchSuggestEventTagChanged>(_tagChanged);
    on<SearchSuggestEventTagSinceChanged>(_tagSinceChanged);
  }

  void _queryChanged(
      SearchSuggestEventQueryChanged event, Emitter<SearchSuggestState> emit) {
    emit(state.copyWith(
      query: state.query.copyWith(query: event.query),
    ));
  }

  void _tagChanged(
      SearchSuggestEventTagChanged event, Emitter<SearchSuggestState> emit) {
    if (event.id == 0) {
      emit(state.copyWith(
        query: state.query.copyWith(withTag: null),
      ));
      return;
    }

    final withTagNew = state.query.withTag == null
        ? WithTag(id: event.id)
        : state.query.withTag!.copyWith(id: event.id);
    emit(state.copyWith(
      query: state.query.copyWith(withTag: withTagNew),
    ));
  }

  void _tagSinceChanged(SearchSuggestEventTagSinceChanged event,
      Emitter<SearchSuggestState> emit) {
    if (state.query.withTag?.id == 0) {
      return;
    }

    final withTagNew = state.query.withTag!.copyWith(since: event.since);
    emit(state.copyWith(
      query: state.query.copyWith(withTag: withTagNew),
    ));
  }
}
