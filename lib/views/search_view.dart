import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/views/widgets/note_item.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/cubits/search_cubit/search_cubit.dart';

class SearchNoteView extends StatefulWidget {
  const SearchNoteView({Key? key}) : super(key: key);

  @override
  State<SearchNoteView> createState() => _SearchNoteViewState();
}

class _SearchNoteViewState extends State<SearchNoteView> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    mini: true,
                    child: const Icon(Icons.arrow_back),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: BlocBuilder<SearchCubit, SearchState>(
                      builder: (context, state) {
                        return TextFormField(
                          controller: searchController,
                          onChanged: (query) {
                            BlocProvider.of<SearchCubit>(context).searchNotes(query);
                          },
                          decoration: const InputDecoration(
                            hintText: 'Search for a note',
                          ),
                        );
                      },
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      searchController.clear();
                      BlocProvider.of<SearchCubit>(context).clearSearch();
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchInitial) {
                    return const Center(
                      child: Text(
                        'Start typing to search your notes...',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  } else if (state is SearchLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is SearchEmpty) {
                    return Center(
                      child: Text(
                        'No notes found for "${state.query}"',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  } else if (state is SearchFailure) {
                    return Center(
                      child: Text(
                        state.errMessage,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                        ),
                      ),
                    );
                  } else if (state is SearchSuccess) {
                    return ListView.builder(
                      itemCount: state.notes.length,
                      itemBuilder: (context, index) {
                        final note = state.notes[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 4),
                          child: NoteItem(note: note),
                        );
                      },
                    );
                  }
                  
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
