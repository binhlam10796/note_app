import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'task_filter_state.dart';

enum TaskFilterType { all, completed, pending }

class TaskFilterCubit extends Cubit<TaskFilterState> {
  TaskFilterCubit() : super(TaskFilterInitial());

  TaskFilterType _currentFilter = TaskFilterType.all;

  TaskFilterType get currentFilter => _currentFilter;

  void setFilter(TaskFilterType filter) {
    _currentFilter = filter;
    emit(TaskFilterChanged(filter));
  }
}