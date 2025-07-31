import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/views/widgets/note_item.dart';
import '../constants.dart';
import '../models/note_model.dart';

class SearchNoteView extends StatefulWidget {
  const SearchNoteView({Key? key}) : super(key: key);

  @override
  State<SearchNoteView> createState() => _SearchNoteViewState();
}

class _SearchNoteViewState extends State<SearchNoteView> {
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  final TextEditingController searchController = TextEditingController();
  List<NoteModel> finalSearchResults = []; // Store search results here

  void searchNotes(String query) {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    final searchResults = <NoteModel>[];

    for (var currentIndex = 0; currentIndex < notesBox.length; currentIndex++) {
      final note = notesBox.getAt(currentIndex)!;
      if (note.title.toLowerCase().contains(query.toLowerCase())) {
        searchResults.add(note);
      }
    }

    setState(() {
      finalSearchResults = searchResults;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // You can customize the app bar here
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                FloatingActionButton(
                  onPressed: () {
                    Navigator.pop(
                        context); // Navigate back to the previous screen (NotesViewBody)
                  },
                  mini: true,
                  child:
                      const Icon(Icons.arrow_back), // Make the button smaller
                ),
                const SizedBox(
                    width: 16), // Add some spacing between the buttons
                Expanded(
                  child: TextFormField(
                    controller: searchController,
                    onChanged:
                        searchNotes, // Call search function on text change
                    decoration: const InputDecoration(
                      hintText: 'Search for a note',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    searchController.clear();
                    searchNotes(''); // Clear the search results
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: finalSearchResults.length,
              itemBuilder: (context, index) {
                final notesResult = finalSearchResults[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                  child: NoteItem(
                    note:
                        notesResult, // Reuse the same design from NotesViewBody
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
