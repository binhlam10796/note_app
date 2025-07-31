part of 'selection_cubit.dart';

@immutable
abstract class SelectionState {}

class SelectionInitial extends SelectionState {}

class SelectionActive extends SelectionState {
  final List<NoteModel> selectedNotes;

  SelectionActive(this.selectedNotes);
}

class SelectionDeleting extends SelectionState {}

class SelectionDeleteSuccess extends SelectionState {}

class SelectionDeleteFailure extends SelectionState {
  final String errMessage;

  SelectionDeleteFailure(this.errMessage);
}