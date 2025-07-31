import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/cubits/selection_cubit/selection_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

import 'custom_icon.dart';
import 'delete_alert_dialog.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({Key? key, required this.note}) : super(key: key);

  final NoteModel note;
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectionCubit, SelectionState>(
      builder: (context, selectionState) {
        final selectionCubit = BlocProvider.of<SelectionCubit>(context);
        final isSelected = selectionCubit.isNoteSelected(note);
        final isSelectionMode = selectionCubit.isSelectionMode;

        return GestureDetector(
          onTap: () {
            if (isSelectionMode) {
              selectionCubit.toggleNoteSelection(note);
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return EditNoteView(note: note);
                }),
              );
            }
          },
          onLongPress: () {
            if (!isSelectionMode) {
              selectionCubit.toggleSelectionMode();
              selectionCubit.toggleNoteSelection(note);
            }
          },
          child: Slidable(
            enabled: !isSelectionMode,
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  borderRadius: BorderRadius.circular(16),
                  label: 'Delete',
                  backgroundColor: Colors.red,
                  icon: Icons.delete,
                  onPressed: (context) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return DeleteAlertDialog(note: note);
                      },
                    );
                  },
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  borderRadius: BorderRadius.circular(16),
                  label: 'Edit',
                  backgroundColor: Colors.green,
                  icon: Icons.edit,
                  onPressed: (context) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return EditNoteView(note: note);
                      }),
                    );
                  },
                )
              ],
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Color(note.color).withOpacity(note.isCompleted ? 0.6 : 1.0),
                borderRadius: BorderRadius.circular(16),
                border: isSelected 
                    ? Border.all(color: Theme.of(context).primaryColor, width: 3)
                    : null,
              ),
              padding: const EdgeInsets.only(left: 16, top: 24, bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ListTile(
                    leading: isSelectionMode
                        ? Icon(
                            isSelected 
                                ? Icons.check_circle 
                                : Icons.radio_button_unchecked,
                            color: isSelected 
                                ? Theme.of(context).primaryColor 
                                : Colors.black.withOpacity(.6),
                            size: 28,
                          )
                        : GestureDetector(
                            onTap: () {
                              BlocProvider.of<NotesCubit>(context).toggleNoteCompletion(note);
                            },
                            child: Icon(
                              note.isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
                              color: note.isCompleted 
                                  ? Colors.green 
                                  : Colors.black.withOpacity(.6),
                              size: 28,
                            ),
                          ),
                    title: Text(
                      note.title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.black,
                        decoration: note.isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                        decorationColor: Colors.black,
                        decorationThickness: 2.0,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (note.category != null) ...[
                          Container(
                            margin: const EdgeInsets.only(top: 8, bottom: 4),
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              note.category!,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black.withOpacity(.7),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            note.subTitle,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black.withOpacity(.4),
                              decoration: note.isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                              decorationColor: Colors.black.withOpacity(.4),
                              decorationThickness: 2.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    trailing: !isSelectionMode
                        ? CustomIcon(
                            onPressed: () async {
                              await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return DeleteAlertDialog(note: note);
                                },
                              );
                            },
                            icon: Icons.delete,
                            iconColor: Colors.black,
                          )
                        : null,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      note.date,
                      style: TextStyle(
                        color: Colors.black.withOpacity(.4),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
