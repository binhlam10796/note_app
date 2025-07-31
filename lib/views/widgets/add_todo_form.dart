import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_todo_cubit/add_todo_cubit.dart';
import 'package:notes_app/models/todo_model.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';
import 'todo_colors_list_view.dart';

class AddTodoForm extends StatefulWidget {
  const AddTodoForm({Key? key}) : super(key: key);

  @override
  State<AddTodoForm> createState() => _AddTodoFormState();
}

class _AddTodoFormState extends State<AddTodoForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, description;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 32),
          CustomTextField(
            hint: 'Task title',
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hint: 'Description (optional)',
            maxLines: 3,
            onSaved: (value) {
              description = value;
            },
          ),
          const SizedBox(height: 32),
          BlocBuilder<AddTodoCubit, AddTodoState>(
            builder: (context, state) {
              return const TodoColorsListView();
            },
          ),
          const SizedBox(height: 32),
          BlocBuilder<AddTodoCubit, AddTodoState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddTodoLoading,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var todoModel = TodoModel(
                      title: title!,
                      description: description,
                      date: DateFormat.yMd().add_jm().format(DateTime.now()),
                      color: BlocProvider.of<AddTodoCubit>(context).color.value,
                    );
                    BlocProvider.of<AddTodoCubit>(context).addTodo(todoModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}