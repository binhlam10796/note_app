import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/todo_model.dart';

part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  TodosCubit() : super(TodosInitial());

  List<TodoModel>? todos;
  
  fetchAllTodos() {
    try {
      emit(TodosLoading());
      var todosBox = Hive.box<TodoModel>(kTodosBox);
      todos = todosBox.values.toList();
      emit(TodosSuccess());
    } catch (e) {
      emit(TodosFailure('Failed to load todos: ${e.toString()}'));
    }
  }

  void toggleTodoCompletion(TodoModel todo) {
    try {
      todo.isCompleted = !todo.isCompleted;
      todo.save();
      fetchAllTodos();
    } catch (e) {
      emit(TodosFailure('Failed to update todo: ${e.toString()}'));
    }
  }
}