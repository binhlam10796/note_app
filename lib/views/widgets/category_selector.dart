import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/category_cubit/category_cubit.dart';
import 'package:notes_app/cubits/selection_cubit/selection_cubit.dart';
import 'package:notes_app/constants.dart';

class CategorySelector extends StatelessWidget {
  const CategorySelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        final categoryCubit = BlocProvider.of<CategoryCubit>(context);
        
        return Container(
          height: 50,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryCubit.getAvailableCategories().length,
            itemBuilder: (context, index) {
              final categories = categoryCubit.getAvailableCategories();
              final category = categories[index];
              final isSelected = (category == 'All' && categoryCubit.selectedCategory == null) ||
                                category == categoryCubit.selectedCategory;
              
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: FilterChip(
                  label: Text(category),
                  selected: isSelected,
                  onSelected: (selected) {
                    // Clear any active selection when changing categories
                    BlocProvider.of<SelectionCubit>(context).clearSelection();
                    
                    if (category == 'All') {
                      categoryCubit.clearCategory();
                    } else {
                      categoryCubit.selectCategory(category);
                    }
                  },
                  selectedColor: kPrimaryColor.withOpacity(0.3),
                  checkmarkColor: kPrimaryColor,
                ),
              );
            },
          ),
        );
      },
    );
  }
}