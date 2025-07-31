import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/todo_model.dart';

part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  TodosCubit() : super(TodosInitial());

  List<TodoModel>? todos;

  fetchAllTodos() {
    var todosBox = Hive.box<TodoModel>(kTodosBox);
    todos = todosBox.values.toList();
    emit(TodosSuccess());
  }
}