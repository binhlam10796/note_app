import 'package:hive/hive.dart';
import 'chapter_model.dart';

part 'learning_topic_model.g.dart';

@HiveType(typeId: 3)
class LearningTopicModel extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String title;

  @HiveField(2)
  List<ChapterModel> chapters;

  @HiveField(3)
  List<String> exercises;

  @HiveField(4)
  final String createdAt;

  LearningTopicModel({
    required this.id,
    required this.title,
    required this.chapters,
    required this.exercises,
    required this.createdAt,
  });

  // Calculate overall progress based on chapters
  double get overallProgress {
    if (chapters.isEmpty) return 0.0;
    final totalProgress =
        chapters.map((c) => c.progress).reduce((a, b) => a + b);
    return totalProgress / chapters.length;
  }

  // Copy method for updates
  LearningTopicModel copyWith({
    int? id,
    String? title,
    List<ChapterModel>? chapters,
    List<String>? exercises,
    String? createdAt,
  }) {
    return LearningTopicModel(
      id: id ?? this.id,
      title: title ?? this.title,
      chapters: chapters ?? this.chapters,
      exercises: exercises ?? this.exercises,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LearningTopicModel &&
        other.id == id &&
        other.title == title &&
        _listEquals(other.chapters, chapters) &&
        _listEquals(other.exercises, exercises) &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        chapters.hashCode ^
        exercises.hashCode ^
        createdAt.hashCode;
  }
}

// Helper function for list equality
bool _listEquals<T>(List<T>? a, List<T>? b) {
  if (a == null) return b == null;
  if (b == null || a.length != b.length) return false;
  if (identical(a, b)) return true;
  for (int index = 0; index < a.length; index += 1) {
    if (a[index] != b[index]) return false;
  }
  return true;
}
