import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  List<NoteModel> searchResults = [];

  void searchNotes(String query) async {
    try {
      if (query.isEmpty) {
        emit(SearchInitial());
        return;
      }

      emit(SearchLoading());
      
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      final results = <NoteModel>[];

      for (var currentIndex = 0; currentIndex < notesBox.length; currentIndex++) {
        final note = notesBox.getAt(currentIndex);
        if (note != null && 
            (note.title.toLowerCase().contains(query.toLowerCase()) ||
             note.subTitle.toLowerCase().contains(query.toLowerCase()))) {
          results.add(note);
        }
      }

      searchResults = results;
      
      if (results.isEmpty) {
        emit(SearchEmpty(query));
      } else {
        emit(SearchSuccess(results));
      }
    } catch (e) {
      emit(SearchFailure('Failed to search notes: ${e.toString()}'));
    }
  }

  void clearSearch() {
    searchResults.clear();
    emit(SearchInitial());
  }
}