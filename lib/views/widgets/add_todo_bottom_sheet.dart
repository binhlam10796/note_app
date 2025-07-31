import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_todo_cubit/add_todo_cubit.dart';
import 'package:notes_app/cubits/todos_cubit/todos_cubit.dart';
import 'package:notes_app/views/widgets/sucess_snack_bar.dart';

import 'add_todo_form.dart';

class AddTodoBottomSheet extends StatelessWidget {
  const AddTodoBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTodoCubit(),
      child: BlocConsumer<AddTodoCubit, AddTodoState>(
        listener: (context, state) {
          if (state is AddTodoFailure) {}

          if (state is AddTodoSuccess) {
            BlocProvider.of<TodosCubit>(context).fetchAllTodos();
            Navigator.pop(context);
            showSuccessSnackBar(
                ScaffoldMessenger.of(context), "Task Added Successfully!");
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddTodoLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const SingleChildScrollView(
                child: AddTodoForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}