import 'package:app/search/bloc/search_suggest_bloc.dart';
import 'package:app/search/view/search_suggest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchAll extends SearchDelegate<void> {
  final SearchSuggestBloc searchBloc;

  SearchAll({required this.searchBloc});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const BackButtonIcon(),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return BlocProvider.value(
      value: searchBloc,
      child: SearchSuggest(
        searchBloc: searchBloc,
        onSearch: (query) {
          // ignore: avoid_print
          print('Search for $query');
        },
      ),
    );
  }
}
