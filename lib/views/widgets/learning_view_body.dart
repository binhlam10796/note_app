import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/learning_cubit/learning_cubit.dart';
import 'learning_topics_list_view.dart';

class LearningViewBody extends StatelessWidget {
  const LearningViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // App Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Text(
                  'English Learning',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    BlocProvider.of<LearningCubit>(context).fetchAllLearningTopics();
                  },
                  icon: const Icon(Icons.refresh),
                ),
              ],
            ),
          ),
          
          // Learning Topics List
          Expanded(
            child: BlocBuilder<LearningCubit, LearningState>(
              builder: (context, state) {
                if (state is LearningLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is LearningFailure) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          size: 64,
                          color: Colors.red,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Error: ${state.errMessage}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<LearningCubit>(context).fetchAllLearningTopics();
                          },
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  );
                } else if (state is LearningSuccess) {
                  final learningCubit = BlocProvider.of<LearningCubit>(context);
                  if (learningCubit.learningTopics?.isEmpty ?? true) {
                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.school_outlined,
                            size: 64,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'No learning topics available',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  }
                  return const LearningTopicsListView();
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}