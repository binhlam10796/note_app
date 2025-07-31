import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/todo_model.dart';

part 'add_todo_state.dart';

class AddTodoCubit extends Cubit<AddTodoState> {
  AddTodoCubit() : super(AddTodoInitial());

  Color color = const Color(0xffDB5461);
  
  addTodo(TodoModel todo) async {
    todo.color = color.value;
    emit(AddTodoLoading());
    try {
      var todosBox = Hive.box<TodoModel>(kTodosBox);
      await todosBox.add(todo);
      emit(AddTodoSuccess());
    } catch (e) {
      emit(AddTodoFailure(e.toString()));
    }
  }
}