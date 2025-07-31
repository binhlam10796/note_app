import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/add_todo_bottom_sheet.dart';
import 'package:notes_app/views/widgets/todos_view_body.dart';

class TodosView extends StatelessWidget {
  const TodosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              context: context,
              builder: (context) {
                return const AddTodoBottomSheet();
              });
        },
        child: const Icon(Icons.add),
      ),
      body: const TodosViewBody(),
    );
  }
}