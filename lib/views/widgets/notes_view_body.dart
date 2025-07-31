import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/views/search_view.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/cubits/selection_cubit/selection_cubit.dart';
import 'package:notes_app/cubits/category_cubit/category_cubit.dart';
import 'custom_app_bar.dart';
import 'notes_list_view.dart';
import 'category_selector.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({Key? key}) : super(key: key);

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SelectionCubit, SelectionState>(
      listener: (context, state) {
        if (state is SelectionDeleteSuccess) {
          BlocProvider.of<NotesCubit>(context).fetchAllNotes();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Notes deleted successfully'),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state is SelectionDeleteFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 16),
            BlocBuilder<SelectionCubit, SelectionState>(
              builder: (context, selectionState) {                
                if (selectionState is SelectionActive) {
                  return _buildSelectionAppBar(selectionState.selectedNotes.length);
                } else {
                  return CustomAppBar(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const SearchNoteView();
                        }),
                      );
                    },
                    title: 'Notes',
                    icon: Icons.search,
                  );
                }
              },
            ),
            const SizedBox(height: 16),
            BlocBuilder<SelectionCubit, SelectionState>(
              builder: (context, selectionState) {
                // Hide category selector when in selection mode
                if (selectionState is SelectionActive) {
                  return const SizedBox.shrink();
                }
                return const CategorySelector();
              },
            ),
            const Expanded(
              child: NotesListView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectionAppBar(int selectedCount) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              BlocProvider.of<SelectionCubit>(context).clearSelection();
            },
            icon: const Icon(Icons.close),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              '$selectedCount selected',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              final notesCubit = BlocProvider.of<NotesCubit>(context);
              final categoryCubit = BlocProvider.of<CategoryCubit>(context);
              if (notesCubit.notes != null) {
                final filteredNotes = categoryCubit.filterNotesByCategory(notesCubit.notes!);
                BlocProvider.of<SelectionCubit>(context).selectAll(filteredNotes);
              }
            },
            icon: const Icon(Icons.select_all),
            tooltip: 'Select All',
          ),
          IconButton(
            onPressed: () {
              _showDeleteConfirmationDialog();
            },
            icon: const Icon(Icons.delete),
            tooltip: 'Delete Selected',
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmationDialog() {
    final selectedCount = BlocProvider.of<SelectionCubit>(context).selectedNotes.length;
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Notes'),
          content: Text('Are you sure you want to delete $selectedCount note${selectedCount > 1 ? 's' : ''}?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                BlocProvider.of<SelectionCubit>(context).deleteSelectedNotes();
              },
              child: const Text('Delete'),
              style: TextButton.styleFrom(foregroundColor: Colors.red),
            ),
          ],
        );
      },
    );
  }
}
