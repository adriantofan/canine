import 'package:applib/applib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../bloc/search_suggest_bloc.dart';

class SearchSuggest extends StatelessWidget {
  final SearchSuggestBloc searchBloc;
  final ValueChanged<SearchQuery> onSearch;

  const SearchSuggest(
      {super.key, required this.searchBloc, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchSuggestBloc, SearchSuggestState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                const Text('With Tag'),
                const SizedBox(width: 15),
                DropdownButton<int>(
                    value: state.query.withTag?.id ?? 0,
                    items: [
                      DropdownMenuItem(child: const Text('None'), value: 0),
                      DropdownMenuItem(child: const Text('Tag 1'), value: 1),
                      DropdownMenuItem(child: const Text('Tag 2'), value: 2),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        context
                            .read<SearchSuggestBloc>()
                            .add(SearchSuggestEvent.tagChanged(value));
                      }
                    }),
                const SizedBox(width: 15),
                const Text('set since'),
                const SizedBox(width: 15),
                SizedBox(
                    width: 110,
                    child: DateField(
                        onChanged: (date) => context
                            .read<SearchSuggestBloc>()
                            .add(SearchSuggestEvent.tagSinceChanged(date)))),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      onSearch(state.query);
                    },
                    child: const Text('Search')),
              ],
            ),
            Container(),
          ],
        );
      },
    );
  }
}

class DateField extends StatefulWidget {
  const DateField({super.key, this.onChanged});
  final ValueChanged<DateTime>? onChanged;

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  final dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchSuggestBloc, SearchSuggestState>(
      listener: (context, state) {
        final since = state.query.withTag?.since;
        if (since != null) {
          dateController.text = DateFormat.yMd().format(since);
        } else {
          dateController.text = '';
        }
      },
      builder: (context, state) {
        final tagNotSelected = (state.query.withTag?.id ?? 0) == 0;
        return TextField(
            controller: dateController, //editing controller of this TextField
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            readOnly: true, // when true user cannot edit text
            onTap: tagNotSelected
                ? null
                : () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: context
                                .read<SearchSuggestBloc>()
                                .state
                                .query
                                .withTag
                                ?.since ??
                            DateTime.now(),
                        firstDate: DateTime(
                            2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      widget.onChanged?.call(pickedDate);
                    }

                    //when click we have to show the datepicker
                  });
      },
    );
  }
}
