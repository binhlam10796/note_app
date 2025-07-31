part of 'todos_cubit.dart';

@immutable
abstract class TodosState {}

class TodosInitial extends TodosState {}

class TodosLoading extends TodosState {}

class TodosSuccess extends TodosState {}

class TodosFailure extends TodosState {
  final String errMessage;

  TodosFailure(this.errMessage);
}