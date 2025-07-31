import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/cubits/category_cubit/category_cubit.dart';
import 'package:notes_app/cubits/task_filter_cubit/task_filter_cubit.dart';
import 'package:notes_app/models/note_model.dart';

import 'note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  String _getEmptyMessage(TaskFilterType filterType) {
    switch (filterType) {
      case TaskFilterType.completed:
        return 'No completed tasks.\nMark some tasks as completed!';
      case TaskFilterType.pending:
        return 'No pending tasks.\nAll tasks are completed!';
      case TaskFilterType.all:
      default:
        return 'No notes in this category.\nSelect a different category or add a new note!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, notesState) {
        if (notesState is NotesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (notesState is NotesFailure) {
          return Center(
            child: Text(
              notesState.errMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.red,
              ),
            ),
          );
        }
        
        List<NoteModel> allNotes = BlocProvider.of<NotesCubit>(context).notes ?? [];
        
        return BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, categoryState) {
            return BlocBuilder<TaskFilterCubit, TaskFilterState>(
              builder: (context, taskFilterState) {
                final categoryCubit = BlocProvider.of<CategoryCubit>(context);
                final taskFilterCubit = BlocProvider.of<TaskFilterCubit>(context);
                
                // First filter by category
                List<NoteModel> filteredNotes = categoryCubit.filterNotesByCategory(allNotes);
                
                // Then filter by task completion status
                switch (taskFilterCubit.currentFilter) {
                  case TaskFilterType.completed:
                    filteredNotes = filteredNotes.where((note) => note.isCompleted).toList();
                    break;
                  case TaskFilterType.pending:
                    filteredNotes = filteredNotes.where((note) => !note.isCompleted).toList();
                    break;
                  case TaskFilterType.all:
                  default:
                    // Show all notes (no additional filtering)
                    break;
                }
                
                if (filteredNotes.isEmpty) {
                  String message = allNotes.isEmpty 
                      ? 'No notes yet.\nTap + to add your first note!'
                      : _getEmptyMessage(taskFilterCubit.currentFilter);
                  
                  return Center(
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  );
                }
                
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ListView.builder(
                      itemCount: filteredNotes.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: NoteItem(
                            note: filteredNotes[index],
                          ),
                        );
                      }),
                );
              },
            );
          },
        );
      },
    );
  }
}
