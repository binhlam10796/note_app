part of 'learning_cubit.dart';

@immutable
abstract class LearningState {}

class LearningInitial extends LearningState {}

class LearningLoading extends LearningState {}

class LearningSuccess extends LearningState {}

class LearningFailure extends LearningState {
  final String errMessage;

  LearningFailure(this.errMessage);
}