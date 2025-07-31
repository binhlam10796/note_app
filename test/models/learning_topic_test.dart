import 'package:flutter_test/flutter_test.dart';
import 'package:notes_app/models/learning_topic_model.dart';
import 'package:notes_app/models/chapter_model.dart';

void main() {
  group('LearningTopicModel', () {
    test('should create a LearningTopicModel with required fields', () {
      // Arrange
      final chapters = [
        ChapterModel(name: 'School', progress: 54),
        ChapterModel(name: 'Jobs', progress: 32),
      ];
      const exercises = ['Grammar', 'Listening', 'Writing'];
      const createdAt = '2024-01-01T00:00:00.000';

      // Act
      final topic = LearningTopicModel(
        id: 1,
        title: 'Jobs and School',
        chapters: chapters,
        exercises: exercises,
        createdAt: createdAt,
      );

      // Assert
      expect(topic.id, 1);
      expect(topic.title, 'Jobs and School');
      expect(topic.chapters, chapters);
      expect(topic.exercises, exercises);
      expect(topic.createdAt, createdAt);
    });

    test('should calculate overall progress correctly', () {
      // Arrange
      final chapters = [
        ChapterModel(name: 'School', progress: 60),
        ChapterModel(name: 'Jobs', progress: 40),
        ChapterModel(name: 'Business', progress: 80),
      ];
      
      final topic = LearningTopicModel(
        id: 1,
        title: 'Test Topic',
        chapters: chapters,
        exercises: const ['Grammar'],
        createdAt: '2024-01-01T00:00:00.000',
      );

      // Act
      final overallProgress = topic.overallProgress;

      // Assert - (60 + 40 + 80) / 3 = 60
      expect(overallProgress, 60.0);
    });

    test('should return 0 progress when no chapters exist', () {
      // Arrange
      final topic = LearningTopicModel(
        id: 1,
        title: 'Empty Topic',
        chapters: [],
        exercises: const ['Grammar'],
        createdAt: '2024-01-01T00:00:00.000',
      );

      // Act
      final overallProgress = topic.overallProgress;

      // Assert
      expect(overallProgress, 0.0);
    });

    test('should support equality comparison', () {
      // Arrange
      final chapters = [ChapterModel(name: 'School', progress: 54)];
      const exercises = ['Grammar'];
      const createdAt = '2024-01-01T00:00:00.000';

      final topic1 = LearningTopicModel(
        id: 1,
        title: 'Topic 1',
        chapters: chapters,
        exercises: exercises,
        createdAt: createdAt,
      );

      final topic2 = LearningTopicModel(
        id: 1,
        title: 'Topic 1',
        chapters: chapters,
        exercises: exercises,
        createdAt: createdAt,
      );

      final topic3 = LearningTopicModel(
        id: 2,
        title: 'Topic 2',
        chapters: chapters,
        exercises: exercises,
        createdAt: createdAt,
      );

      // Assert
      expect(topic1, equals(topic2));
      expect(topic1, isNot(equals(topic3)));
    });

    test('should create a copy with updated fields', () {
      // Arrange
      final originalTopic = LearningTopicModel(
        id: 1,
        title: 'Original Title',
        chapters: [ChapterModel(name: 'School', progress: 54)],
        exercises: const ['Grammar'],
        createdAt: '2024-01-01T00:00:00.000',
      );

      // Act
      final updatedTopic = originalTopic.copyWith(
        title: 'Updated Title',
        id: 2,
      );

      // Assert
      expect(updatedTopic.id, 2);
      expect(updatedTopic.title, 'Updated Title');
      expect(updatedTopic.chapters, originalTopic.chapters);
      expect(updatedTopic.exercises, originalTopic.exercises);
      expect(updatedTopic.createdAt, originalTopic.createdAt);
      
      // Original should be unchanged
      expect(originalTopic.id, 1);
      expect(originalTopic.title, 'Original Title');
    });

    test('copyWith should preserve original values when null is passed', () {
      // Arrange
      final originalTopic = LearningTopicModel(
        id: 1,
        title: 'Test Topic',
        chapters: [ChapterModel(name: 'School', progress: 54)],
        exercises: const ['Grammar'],
        createdAt: '2024-01-01T00:00:00.000',
      );

      // Act
      final copiedTopic = originalTopic.copyWith();

      // Assert
      expect(copiedTopic.id, originalTopic.id);
      expect(copiedTopic.title, originalTopic.title);
      expect(copiedTopic.chapters, originalTopic.chapters);
      expect(copiedTopic.exercises, originalTopic.exercises);
      expect(copiedTopic.createdAt, originalTopic.createdAt);
    });

    test('should have consistent hashCode for equal objects', () {
      // Arrange
      final chapters = [ChapterModel(name: 'School', progress: 54)];
      const exercises = ['Grammar'];
      const createdAt = '2024-01-01T00:00:00.000';

      final topic1 = LearningTopicModel(
        id: 1,
        title: 'Topic',
        chapters: chapters,
        exercises: exercises,
        createdAt: createdAt,
      );

      final topic2 = LearningTopicModel(
        id: 1,
        title: 'Topic',
        chapters: chapters,
        exercises: exercises,
        createdAt: createdAt,
      );

      // Assert
      expect(topic1.hashCode, equals(topic2.hashCode));
    });
  });
}