import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/todos_cubit/todos_cubit.dart';
import 'package:notes_app/models/todo_model.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/edit_todo_colors_list_view.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class EditTodoViewBody extends StatefulWidget {
  const EditTodoViewBody({Key? key, required this.todo}) : super(key: key);

  final TodoModel todo;

  @override
  State<EditTodoViewBody> createState() => _EditTodoViewBodyState();
}

class _EditTodoViewBodyState extends State<EditTodoViewBody> {
  String? title, description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomAppBar(
            title: 'Edit Task',
            onPressed: () {
              widget.todo.title = title ?? widget.todo.title;
              widget.todo.description = description ?? widget.todo.description;
              widget.todo.save();
              BlocProvider.of<TodosCubit>(context).fetchAllTodos();
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextField(
            hint: widget.todo.title,
            onChanged: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            hint: widget.todo.description,
            maxLines: 5,
            onChanged: (value) {
              description = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          EditTodoColorsListView(
            todo: widget.todo,
          ),
        ],
      ),
    );
  }
}