part of 'task_filter_cubit.dart';

@immutable
abstract class TaskFilterState {}

class TaskFilterInitial extends TaskFilterState {}

class TaskFilterChanged extends TaskFilterState {
  final TaskFilterType filterType;

  TaskFilterChanged(this.filterType);
}