import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'selection_state.dart';

class SelectionCubit extends Cubit<SelectionState> {
  SelectionCubit() : super(SelectionInitial());

  Set<NoteModel> selectedNotes = {};
  bool isSelectionMode = false;

  void toggleSelectionMode() {
    isSelectionMode = !isSelectionMode;
    if (!isSelectionMode) {
      selectedNotes.clear();
      emit(SelectionInitial());
    } else {
      emit(SelectionActive(selectedNotes.toList()));
    }
  }

  void toggleNoteSelection(NoteModel note) {
    if (selectedNotes.contains(note)) {
      selectedNotes.remove(note);
    } else {
      selectedNotes.add(note);
    }

    if (selectedNotes.isEmpty && isSelectionMode) {
      isSelectionMode = false;
      emit(SelectionInitial());
    } else {
      emit(SelectionActive(selectedNotes.toList()));
    }
  }

  void selectAll(List<NoteModel> allNotes) {
    selectedNotes.addAll(allNotes);
    emit(SelectionActive(selectedNotes.toList()));
  }

  void clearSelection() {
    selectedNotes.clear();
    isSelectionMode = false;
    emit(SelectionInitial());
  }

  void deleteSelectedNotes() async {
    try {
      emit(SelectionDeleting());
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      
      for (var note in selectedNotes) {
        await note.delete();
      }
      
      selectedNotes.clear();
      isSelectionMode = false;
      emit(SelectionDeleteSuccess());
    } catch (e) {
      emit(SelectionDeleteFailure('Failed to delete notes: ${e.toString()}'));
    }
  }

  bool isNoteSelected(NoteModel note) {
    return selectedNotes.contains(note);
  }
}