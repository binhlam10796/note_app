part of 'add_todo_cubit.dart';

@immutable
abstract class AddTodoState {}

class AddTodoInitial extends AddTodoState {}

class AddTodoLoading extends AddTodoState {}

class AddTodoSuccess extends AddTodoState {}

class AddTodoFailure extends AddTodoState {
  final String errMessage;

  AddTodoFailure(this.errMessage);
}