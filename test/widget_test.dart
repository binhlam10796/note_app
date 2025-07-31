// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/main.dart';
import 'package:notes_app/models/note_model.dart';

void main() {
  setUpAll(() async {
    // Initialize Hive for testing
    await Hive.initFlutter();
    Hive.registerAdapter(NoteModelAdapter());
  });

  tearDownAll(() async {
    // Clean up after tests
    await Hive.close();
  });

  testWidgets('NotesApp basic rendering test', (WidgetTester tester) async {
    // Open the test box
    await Hive.openBox<NoteModel>(kNotesBox);

    // Build our app and trigger a frame.
    await tester.pumpWidget(const NotesApp());

    // Verify that the app renders without errors
    expect(find.byType(MaterialApp), findsOneWidget);

    // Clean up the test box
    final box = Hive.box<NoteModel>(kNotesBox);
    await box.clear();
    await box.close();
  });

  testWidgets('Notes app title and floating action button test', (WidgetTester tester) async {
    // Open the test box
    await Hive.openBox<NoteModel>(kNotesBox);

    // Build our app and trigger a frame.
    await tester.pumpWidget(const NotesApp());
    await tester.pumpAndSettle();

    // Verify that we can find a floating action button (add note button)
    expect(find.byType(FloatingActionButton), findsOneWidget);

    // Clean up the test box
    final box = Hive.box<NoteModel>(kNotesBox);
    await box.clear();
    await box.close();
  });
}
