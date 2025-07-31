import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/task_filter_cubit/task_filter_cubit.dart';

class TaskFilterSelector extends StatelessWidget {
  const TaskFilterSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskFilterCubit, TaskFilterState>(
      builder: (context, state) {
        final taskFilterCubit = BlocProvider.of<TaskFilterCubit>(context);
        final currentFilter = taskFilterCubit.currentFilter;

        return Container(
          height: 40,
          margin: const EdgeInsets.only(bottom: 16),
          child: Row(
            children: [
              _buildFilterChip(
                context,
                'All',
                TaskFilterType.all,
                currentFilter == TaskFilterType.all,
                taskFilterCubit,
              ),
              const SizedBox(width: 8),
              _buildFilterChip(
                context,
                'Pending',
                TaskFilterType.pending,
                currentFilter == TaskFilterType.pending,
                taskFilterCubit,
              ),
              const SizedBox(width: 8),
              _buildFilterChip(
                context,
                'Completed',
                TaskFilterType.completed,
                currentFilter == TaskFilterType.completed,
                taskFilterCubit,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFilterChip(
    BuildContext context,
    String label,
    TaskFilterType filter,
    bool isSelected,
    TaskFilterCubit cubit,
  ) {
    return GestureDetector(
      onTap: () {
        cubit.setFilter(filter);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected 
              ? Theme.of(context).primaryColor 
              : Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected 
                ? Theme.of(context).primaryColor 
                : Colors.grey.withOpacity(0.3),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.white70,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}