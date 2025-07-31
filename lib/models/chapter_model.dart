import 'package:hive/hive.dart';

part 'chapter_model.g.dart';

@HiveType(typeId: 2)
class ChapterModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  int progress;

  ChapterModel({
    required this.name,
    required this.progress,
  });

  // Copy method for updating progress
  ChapterModel copyWith({
    String? name,
    int? progress,
  }) {
    return ChapterModel(
      name: name ?? this.name,
      progress: progress ?? this.progress,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ChapterModel &&
        other.name == name &&
        other.progress == progress;
  }

  @override
  int get hashCode => name.hashCode ^ progress.hashCode;
}