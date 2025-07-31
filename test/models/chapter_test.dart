import 'package:flutter_test/flutter_test.dart';
import 'package:notes_app/models/chapter_model.dart';

void main() {
  group('ChapterModel', () {
    test('should create a ChapterModel with required fields', () {
      // Arrange & Act
      const chapter = ChapterModel(
        name: 'School',
        progress: 54,
      );

      // Assert
      expect(chapter.name, 'School');
      expect(chapter.progress, 54);
    });

    test('should support equality comparison', () {
      // Arrange
      const chapter1 = ChapterModel(name: 'School', progress: 54);
      const chapter2 = ChapterModel(name: 'School', progress: 54);
      const chapter3 = ChapterModel(name: 'Jobs', progress: 32);

      // Assert
      expect(chapter1, equals(chapter2));
      expect(chapter1, isNot(equals(chapter3)));
    });

    test('should create a copy with updated fields', () {
      // Arrange
      const originalChapter = ChapterModel(name: 'School', progress: 54);

      // Act
      final updatedChapter = originalChapter.copyWith(progress: 75);

      // Assert
      expect(updatedChapter.name, 'School');
      expect(updatedChapter.progress, 75);
      expect(originalChapter.progress, 54); // Original unchanged
    });

    test('copyWith should preserve original values when null is passed', () {
      // Arrange
      const originalChapter = ChapterModel(name: 'School', progress: 54);

      // Act
      final copiedChapter = originalChapter.copyWith();

      // Assert
      expect(copiedChapter.name, originalChapter.name);
      expect(copiedChapter.progress, originalChapter.progress);
    });

    test('should have consistent hashCode for equal objects', () {
      // Arrange
      const chapter1 = ChapterModel(name: 'School', progress: 54);
      const chapter2 = ChapterModel(name: 'School', progress: 54);

      // Assert
      expect(chapter1.hashCode, equals(chapter2.hashCode));
    });
  });
}