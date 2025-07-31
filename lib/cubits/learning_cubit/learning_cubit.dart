import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/learning_topic_model.dart';
import 'package:notes_app/models/chapter_model.dart';

part 'learning_state.dart';

class LearningCubit extends Cubit<LearningState> {
  LearningCubit() : super(LearningInitial());

  List<LearningTopicModel>? learningTopics;

  // Fetch all learning topics
  fetchAllLearningTopics() {
    try {
      emit(LearningLoading());
      var learningBox = Hive.box<LearningTopicModel>(kLearningTopicsBox);
      learningTopics = learningBox.values.toList();
      
      // If no topics exist, create sample data
      if (learningTopics!.isEmpty) {
        _createSampleData();
      }
      
      emit(LearningSuccess());
    } catch (e) {
      emit(LearningFailure('Failed to load learning topics: ${e.toString()}'));
    }
  }

  // Create sample learning topics based on the JSON requirement
  void _createSampleData() {
    try {
      var learningBox = Hive.box<LearningTopicModel>(kLearningTopicsBox);
      
      // Sample data based on the issue requirement
      final sampleTopics = [
        LearningTopicModel(
          id: 1,
          title: "Jobs and School",
          chapters: [
            ChapterModel(name: "School", progress: 54),
            ChapterModel(name: "Jobs", progress: 32),
          ],
          exercises: ["Grammar", "Listening", "Writing"],
          createdAt: DateTime.now().toString(),
        ),
        LearningTopicModel(
          id: 2,
          title: "Daily Life",
          chapters: [
            ChapterModel(name: "Family", progress: 78),
            ChapterModel(name: "Home", progress: 45),
            ChapterModel(name: "Food", progress: 89),
          ],
          exercises: ["Grammar", "Listening", "Speaking"],
          createdAt: DateTime.now().toString(),
        ),
        LearningTopicModel(
          id: 3,
          title: "Travel & Transport",
          chapters: [
            ChapterModel(name: "Airport", progress: 23),
            ChapterModel(name: "Hotel", progress: 67),
            ChapterModel(name: "Directions", progress: 41),
          ],
          exercises: ["Grammar", "Listening", "Writing", "Speaking"],
          createdAt: DateTime.now().toString(),
        ),
      ];

      for (var topic in sampleTopics) {
        learningBox.add(topic);
      }
      
      learningTopics = sampleTopics;
    } catch (e) {
      emit(LearningFailure('Failed to create sample data: ${e.toString()}'));
    }
  }

  // Update chapter progress
  void updateChapterProgress(int topicId, String chapterName, int newProgress) {
    try {
      if (learningTopics == null) return;
      
      var learningBox = Hive.box<LearningTopicModel>(kLearningTopicsBox);
      
      // Find the topic and chapter to update
      final topicIndex = learningTopics!.indexWhere((topic) => topic.id == topicId);
      if (topicIndex == -1) return;
      
      final topic = learningTopics![topicIndex];
      final chapterIndex = topic.chapters.indexWhere((chapter) => chapter.name == chapterName);
      if (chapterIndex == -1) return;
      
      // Update the chapter progress
      topic.chapters[chapterIndex].progress = newProgress;
      
      // Save to Hive
      topic.save();
      
      // Update local list
      learningTopics![topicIndex] = topic;
      
      emit(LearningSuccess());
    } catch (e) {
      emit(LearningFailure('Failed to update chapter progress: ${e.toString()}'));
    }
  }

  // Add new learning topic
  void addLearningTopic(LearningTopicModel topic) {
    try {
      var learningBox = Hive.box<LearningTopicModel>(kLearningTopicsBox);
      learningBox.add(topic);
      learningTopics?.add(topic);
      emit(LearningSuccess());
    } catch (e) {
      emit(LearningFailure('Failed to add learning topic: ${e.toString()}'));
    }
  }

  // Delete learning topic
  void deleteLearningTopic(LearningTopicModel topic) {
    try {
      topic.delete();
      learningTopics?.remove(topic);
      emit(LearningSuccess());
    } catch (e) {
      emit(LearningFailure('Failed to delete learning topic: ${e.toString()}'));
    }
  }
}