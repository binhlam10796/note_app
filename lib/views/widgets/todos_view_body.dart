import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/todos_cubit/todos_cubit.dart';
import 'custom_app_bar.dart';
import 'todos_list_view.dart';

class TodosViewBody extends StatefulWidget {
  const TodosViewBody({Key? key}) : super(key: key);

  @override
  State<TodosViewBody> createState() => _TodosViewBodyState();
}

class _TodosViewBodyState extends State<TodosViewBody> {
  @override
  void initState() {
    BlocProvider.of<TodosCubit>(context).fetchAllTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 16),
          const CustomAppBar(
            title: 'To-Do List',
            icon: Icons.task_alt,
          ),
          const SizedBox(height: 16),
          const Expanded(
            child: TodosListView(),
          ),
        ],
      ),
    );
  }
}