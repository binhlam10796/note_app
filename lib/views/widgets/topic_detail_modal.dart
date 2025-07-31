import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/learning_topic_model.dart';
import 'package:notes_app/cubits/learning_cubit/learning_cubit.dart';

class TopicDetailModal extends StatelessWidget {
  const TopicDetailModal({
    Key? key,
    required this.topic,
  }) : super(key: key);

  final LearningTopicModel topic;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle bar
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Title and overall progress
          Row(
            children: [
              Expanded(
                child: Text(
                  topic.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 6.0,
                ),
                decoration: BoxDecoration(
                  color: _getProgressColor(topic.overallProgress),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Text(
                  '${topic.overallProgress.round()}% Complete',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Overall progress bar
          LinearProgressIndicator(
            value: topic.overallProgress / 100,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(
              _getProgressColor(topic.overallProgress),
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Chapters section
          const Text(
            'Chapters',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          const SizedBox(height: 12),
          
          Expanded(
            child: ListView.builder(
              itemCount: topic.chapters.length,
              itemBuilder: (context, index) {
                final chapter = topic.chapters[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: _getProgressColor(chapter.progress.toDouble()),
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(
                      chapter.name,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        LinearProgressIndicator(
                          value: chapter.progress / 100,
                          backgroundColor: Colors.grey[300],
                          valueColor: AlwaysStoppedAnimation<Color>(
                            _getProgressColor(chapter.progress.toDouble()),
                          ),
                        ),
                        const SizedBox(height: 4),
                      ],
                    ),
                    trailing: Text(
                      '${chapter.progress}%',
                      style: TextStyle(
                        color: _getProgressColor(chapter.progress.toDouble()),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      _showChapterProgressDialog(context, chapter);
                    },
                  ),
                );
              },
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Exercises section
          const Text(
            'Available Exercises',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          const SizedBox(height: 12),
          
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: topic.exercises.map((exercise) => Chip(
              label: Text(exercise),
              backgroundColor: Colors.blue[100],
              avatar: const Icon(
                Icons.play_circle_outline,
                size: 18,
              ),
            )).toList(),
          ),
          
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Color _getProgressColor(double progress) {
    if (progress >= 80) return Colors.green;
    if (progress >= 50) return Colors.orange;
    return Colors.red;
  }

  void _showChapterProgressDialog(BuildContext context, chapter) {
    int currentProgress = chapter.progress;
    
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('Update Progress: ${chapter.name}'),
        content: StatefulBuilder(
          builder: (context, setState) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Progress: ${currentProgress.round()}%',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Slider(
                value: currentProgress.toDouble(),
                min: 0,
                max: 100,
                divisions: 20,
                onChanged: (value) {
                  setState(() {
                    currentProgress = value.round();
                  });
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<LearningCubit>(context).updateChapterProgress(
                topic.id,
                chapter.name,
                currentProgress,
              );
              Navigator.of(dialogContext).pop();
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }
}