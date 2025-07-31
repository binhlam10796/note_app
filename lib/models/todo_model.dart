import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 3)
class TodoModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(2)
  final String date;
  @HiveField(3)
  bool isCompleted;
  @HiveField(4)
  int color;

  TodoModel({
    required this.title,
    required this.description,
    required this.date,
    this.isCompleted = false,
    required this.color,
  });
}