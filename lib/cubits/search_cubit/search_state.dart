part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<NoteModel> notes;

  SearchSuccess(this.notes);
}

class SearchEmpty extends SearchState {
  final String query;

  SearchEmpty(this.query);
}

class SearchFailure extends SearchState {
  final String errMessage;

  SearchFailure(this.errMessage);
}