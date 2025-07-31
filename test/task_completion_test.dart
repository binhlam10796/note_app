import 'package:flutter_test/flutter_test.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/cubits/task_filter_cubit/task_filter_cubit.dart';

void main() {
  group('Task Completion Feature Tests', () {
    test('NoteModel creates with correct default values', () {
      final note = NoteModel(
        title: 'Test Task',
        subTitle: 'Test Description',
        date: '01-01-2024',
        color: 0xFF000000,
      );

      expect(note.title, 'Test Task');
      expect(note.subTitle, 'Test Description');
      expect(note.isCompleted, false); // Default value should be false
      expect(note.category, null);
    });

    test('NoteModel can be created with completion status', () {
      final completedNote = NoteModel(
        title: 'Completed Task',
        subTitle: 'This is done',
        date: '01-01-2024',
        color: 0xFF000000,
        isCompleted: true,
      );

      expect(completedNote.isCompleted, true);
    });

    test('TaskFilterCubit initializes with correct default state', () {
      final cubit = TaskFilterCubit();
      expect(cubit.currentFilter, TaskFilterType.all);
    });

    test('TaskFilterCubit changes filter correctly', () {
      final cubit = TaskFilterCubit();
      
      cubit.setFilter(TaskFilterType.completed);
      expect(cubit.currentFilter, TaskFilterType.completed);
      
      cubit.setFilter(TaskFilterType.pending);
      expect(cubit.currentFilter, TaskFilterType.pending);
      
      cubit.setFilter(TaskFilterType.all);
      expect(cubit.currentFilter, TaskFilterType.all);
    });
  });
}