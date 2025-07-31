import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';
import 'package:notes_app/views/widgets/sucess_snack_bar.dart';
import 'package:notes_app/constants.dart';

import 'edit_note_colors_list_view.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({Key? key, required this.note}) : super(key: key);

  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content, selectedCategory;
  
  @override
  void initState() {
    super.initState();
    selectedCategory = widget.note.category;
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomAppBar(
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = content ?? widget.note.subTitle;
              widget.note.category = selectedCategory;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
              showSuccessSnackBar(
                  ScaffoldMessenger.of(context), "Note Edited Successfully!");
            },
            title: 'Edit Note',
            icon: Icons.check,
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextField(
            onChanged: (value) {
              title = value;
            },
            hint: widget.note.title,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onChanged: (value) {
              content = value;
            },
            hint: widget.note.subTitle,
            maxLines: 5,
          ),
          const SizedBox(
            height: 16,
          ),
          _buildCategoryDropdown(),
          const SizedBox(
            height: 16,
          ),
          EditNoteColorsList(
            note: widget.note,
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryDropdown() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(16),
      ),
      child: DropdownButton<String?>(
        value: selectedCategory,
        hint: const Text('Select Category (Optional)'),
        isExpanded: true,
        underline: Container(),
        items: [
          const DropdownMenuItem<String?>(
            value: null,
            child: Text('No Category'),
          ),
          ...kCategories.map((String category) {
            return DropdownMenuItem<String>(
              value: category,
              child: Text(category),
            );
          }).toList(),
        ],
        onChanged: (String? newValue) {
          setState(() {
            selectedCategory = newValue;
          });
        },
      ),
    );
  }
}
