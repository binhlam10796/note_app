import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/todos_cubit/todos_cubit.dart';
import 'package:notes_app/models/todo_model.dart';
import 'package:notes_app/views/widgets/edit_todo_view_body.dart';

class EditTodoView extends StatelessWidget {
  const EditTodoView({Key? key, required this.todo}) : super(key: key);

  final TodoModel todo;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodosCubit(),
      child: Scaffold(
        body: EditTodoViewBody(
          todo: todo,
        ),
      ),
    );
  }
}