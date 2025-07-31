import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/learning_cubit/learning_cubit.dart';
import 'learning_topic_item.dart';

class LearningTopicsListView extends StatelessWidget {
  const LearningTopicsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final learningCubit = BlocProvider.of<LearningCubit>(context);
    final topics = learningCubit.learningTopics ?? [];

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      itemCount: topics.length,
      itemBuilder: (context, index) {
        return LearningTopicItem(
          topic: topics[index],
        );
      },
    );
  }
}