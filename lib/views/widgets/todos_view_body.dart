import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/todos_cubit/todos_cubit.dart';
import 'package:notes_app/views/widgets/todos_list_view.dart';

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
          const SizedBox(height: 50),
          Row(
            children: [
              Text(
                'To-Do List',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
            ],
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