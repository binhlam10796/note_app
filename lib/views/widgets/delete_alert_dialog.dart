import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/views/widgets/sucess_snack_bar.dart';

import '../../cubits/notes_cubit/notes_cubit.dart';
import '../../models/note_model.dart';

class DeleteAlertDialog extends StatelessWidget {
  const DeleteAlertDialog({
    super.key,
    required this.note,
  });

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Delete Note'),
      content: const Text('Are you sure you want to delete this note?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          child: const Text('Delete'),
          onPressed: () {
            // Delete the note
            note.delete();
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();

            // Close the dialog
            Navigator.of(context).pop();

            // Show a success alert
            showSuccessSnackBar(
                ScaffoldMessenger.of(context), "Note Deleted Sucessfully!");
          },
        ),
      ],
    );
  }
}
