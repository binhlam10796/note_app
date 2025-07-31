// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_topic_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LearningTopicModelAdapter extends TypeAdapter<LearningTopicModel> {
  @override
  final int typeId = 3;

  @override
  LearningTopicModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LearningTopicModel(
      id: fields[0] as int,
      title: fields[1] as String,
      chapters: (fields[2] as List).cast<ChapterModel>(),
      exercises: (fields[3] as List).cast<String>(),
      createdAt: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LearningTopicModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.chapters)
      ..writeByte(3)
      ..write(obj.exercises)
      ..writeByte(4)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LearningTopicModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}