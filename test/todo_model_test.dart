import 'package:flutter_test/flutter_test.dart';
import 'package:notes_app/models/todo_model.dart';

void main() {
  group('TodoModel Tests', () {
    test('TodoModel creation with default values', () {
      final todo = TodoModel(
        title: 'Test Task',
        description: 'Test Description',
        date: '12/25/2023',
        color: 0xFFFF0000,
      );

      expect(todo.title, 'Test Task');
      expect(todo.description, 'Test Description');
      expect(todo.date, '12/25/2023');
      expect(todo.isCompleted, false); // Default value
      expect(todo.color, 0xFFFF0000);
    });

    test('TodoModel completion toggle', () {
      final todo = TodoModel(
        title: 'Test Task',
        description: 'Test Description',
        date: '12/25/2023',
        color: 0xFFFF0000,
      );

      expect(todo.isCompleted, false);
      
      todo.isCompleted = true;
      expect(todo.isCompleted, true);
      
      todo.isCompleted = false;
      expect(todo.isCompleted, false);
    });

    test('TodoModel with completed status', () {
      final todo = TodoModel(
        title: 'Completed Task',
        description: 'Already done',
        date: '12/25/2023',
        isCompleted: true,
        color: 0xFF00FF00,
      );

      expect(todo.isCompleted, true);
      expect(todo.title, 'Completed Task');
    });

    test('TodoModel title and description modification', () {
      final todo = TodoModel(
        title: 'Original Title',
        description: 'Original Description',
        date: '12/25/2023',
        color: 0xFF0000FF,
      );

      todo.title = 'Updated Title';
      todo.description = 'Updated Description';

      expect(todo.title, 'Updated Title');
      expect(todo.description, 'Updated Description');
    });
  });
}