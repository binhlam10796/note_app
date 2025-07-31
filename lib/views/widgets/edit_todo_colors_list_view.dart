import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/todo_model.dart';
import 'package:notes_app/views/widgets/colors_list_view.dart';

class EditTodoColorsListView extends StatefulWidget {
  const EditTodoColorsListView({Key? key, required this.todo}) : super(key: key);

  final TodoModel todo;

  @override
  State<EditTodoColorsListView> createState() => _EditTodoColorsListViewState();
}

class _EditTodoColorsListViewState extends State<EditTodoColorsListView> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.todo.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                widget.todo.color = kColors[index].value;
                setState(() {});
              },
              child: ColorItem(
                color: kColors[index],
                isActive: currentIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}