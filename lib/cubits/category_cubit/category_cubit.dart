import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  String? selectedCategory;

  void selectCategory(String? category) {
    selectedCategory = category;
    if (category == null) {
      emit(CategoryAll());
    } else {
      emit(CategorySelected(category));
    }
  }

  void clearCategory() {
    selectedCategory = null;
    emit(CategoryAll());
  }

  List<NoteModel> filterNotesByCategory(List<NoteModel> allNotes) {
    if (selectedCategory == null) {
      return allNotes;
    }
    
    return allNotes.where((note) => 
        note.category == selectedCategory || 
        (note.category == null && selectedCategory == 'Other')
    ).toList();
  }

  List<String> getAvailableCategories() {
    return ['All', ...kCategories];
  }
}