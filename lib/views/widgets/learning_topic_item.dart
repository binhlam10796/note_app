import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/learning_topic_model.dart';
import 'package:notes_app/cubits/learning_cubit/learning_cubit.dart';
import 'topic_detail_modal.dart';

class LearningTopicItem extends StatelessWidget {
  const LearningTopicItem({
    Key? key,
    required this.topic,
  }) : super(key: key);

  final LearningTopicModel topic;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: () {
          _showTopicDetail(context);
        },
        borderRadius: BorderRadius.circular(8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title and Overall Progress
              Row(
                children: [
                  Expanded(
                    child: Text(
                      topic.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 4.0,
                    ),
                    decoration: BoxDecoration(
                      color: _getProgressColor(topic.overallProgress),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(
                      '${topic.overallProgress.round()}%',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 12),
              
              // Overall Progress Bar
              LinearProgressIndicator(
                value: topic.overallProgress / 100,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(
                  _getProgressColor(topic.overallProgress),
                ),
              ),
              
              const SizedBox(height: 12),
              
              // Chapters Info
              Text(
                'Chapters: ${topic.chapters.length}',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
              
              const SizedBox(height: 4),
              
              // Exercises Info
              Wrap(
                spacing: 8.0,
                children: topic.exercises.take(3).map((exercise) => Chip(
                  label: Text(
                    exercise,
                    style: const TextStyle(fontSize: 12),
                  ),
                  backgroundColor: Colors.grey[200],
                  padding: EdgeInsets.zero,
                )).toList(),
              ),
              
              // Show additional exercises count if more than 3
              if (topic.exercises.length > 3)
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    '+${topic.exercises.length - 3} more exercises',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getProgressColor(double progress) {
    if (progress >= 80) return Colors.green;
    if (progress >= 50) return Colors.orange;
    return Colors.red;
  }

  void _showTopicDetail(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (context) => BlocProvider.value(
        value: BlocProvider.of<LearningCubit>(context),
        child: TopicDetailModal(topic: topic),
      ),
    );
  }
}