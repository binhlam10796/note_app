import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/learning_cubit/learning_cubit.dart';
import 'widgets/learning_view_body.dart';

class LearningView extends StatelessWidget {
  const LearningView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LearningCubit()..fetchAllLearningTopics(),
      child: const Scaffold(
        body: LearningViewBody(),
      ),
    );
  }
}