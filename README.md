# NotesHub

# NotesHub - Simple To-Do App

**Enhanced Notes app with To-Do functionality made using Flutter with Hive**

## Features 
- ✍️ **Craft & Revise Notes Easily**: Create and adjust your thoughts with simplicity.
- ✅ **Task Completion Tracking**: Mark tasks as completed with visual feedback and status persistence.
- 🎯 **Smart Task Filtering**: Filter tasks by completion status (All, Pending, Completed).
- 🔍 **Rapid Search**: Quickly locate your notes using the robust search function with content and title search.
- 📂 **Category Organization**: Organize notes by categories (Personal, Work, Shopping, Ideas, Travel, Health, Education, Finance, Other).
- 🎯 **Multi-Note Selection**: Select multiple notes for batch operations like deletion.
- ⌚️ **Timestamps**: Every note is marked with its creation date and time.
- 🎨 **Customizable Colors**: Personalize your notes with different color themes.
- 💾 **Reliable Storage**: All data stored locally using Hive database.
- 🔄 **State Management**: Built with BLoC pattern for predictable state management.
- 📱 **Cross-platform**: Works on Android and iOS devices.

## Screenshots
![NotesView](https://github.com/m-1226/NotesHub/assets/64734981/4fc54256-63db-4cf7-8190-026f9b91923f) ![EditNoteView](https://github.com/m-1226/NotesHub/assets/64734981/6537c6f6-e499-4118-9a8a-e372c40cee34) ![SearchNoteView](https://github.com/m-1226/NotesHub/assets/64734981/8cba4571-1a35-42d3-91d6-9275aaf84fa7) ![slide_delete](https://github.com/m-1226/NotesHub/assets/64734981/9258914b-b777-4ab9-a9ff-3f0b59dd6367)  ![slide_edit](https://github.com/m-1226/NotesHub/assets/64734981/bc9453f4-9469-46aa-8175-9f0a0260b792)

## Tech Stack

- **Framework**: Flutter 3.24.2+
- **Language**: Dart
- **Database**: Hive (Local NoSQL database)
- **State Management**: BLoC (Business Logic Component)
- **UI Components**: Material Design

## Dependencies

- `flutter_bloc`: State management
- `hive`: Local database
- `hive_flutter`: Flutter integration for Hive
- `flutter_slidable`: Swipe actions for list items
- `intl`: Internationalization and date formatting
- `modal_progress_hud_nsn`: Loading indicators

## Development Setup

### Prerequisites

- Flutter SDK (3.24.2 or higher)
- Dart SDK
- Android Studio / Xcode (for mobile development)
- VS Code (recommended) with Flutter extensions

### Getting Started

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd NotesHub-main
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate Hive adapters**
   ```bash
   dart run build_runner build
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

### VS Code Development

This project includes comprehensive VS Code configuration:

#### Launch Configurations
- **Debug Flutter App**: Standard debug mode
- **Profile Flutter App**: Performance profiling
- **Release Flutter App**: Release mode testing
- **Debug Android/iOS**: Platform-specific debugging
- **Debug Tests**: Run widget and unit tests

#### Available Tasks
- `Flutter: Get Dependencies`
- `Flutter: Clean`
- `Flutter: Build APK (Debug/Release)`
- `Flutter: Build iOS (Debug/Release)`
- `Flutter: Run Tests`
- `Flutter: Analyze`
- `Flutter: Format Code`
- `Hive: Generate Code`
- `Hive: Watch Code Generation`

#### Recommended Extensions
- Dart & Flutter extensions
- Better Comments
- Error Lens
- GitLens
- Flutter Snippets
- Material Icon Theme

### Building for Production

#### Android
```bash
# Debug APK
flutter build apk --debug

# Release APK
flutter build apk --release

# App Bundle (recommended for Play Store)
flutter build appbundle --release
```

#### iOS
```bash
# Debug build
flutter build ios --debug --no-codesign

# Release build
flutter build ios --release
```

### Project Structure

```
lib/
├── main.dart                 # App entry point
├── constants.dart           # App constants and categories
├── simple_bloc_observer.dart # BLoC observer
├── cubits/                  # State management
│   ├── add_note_cubit/      # Adding new notes
│   ├── notes_cubit/         # Notes data management
│   ├── search_cubit/        # Search functionality
│   ├── selection_cubit/     # Multi-note selection
│   └── category_cubit/      # Category filtering
├── models/                  # Data models
│   ├── note_model.dart      # Note data model with category
│   └── note_model.g.dart   # Generated Hive adapter
└── views/                   # UI screens and widgets
    ├── notes_view.dart      # Main notes screen
    ├── edit_note_view.dart  # Edit note screen
    ├── search_view.dart     # Search screen
    └── widgets/            # Reusable widgets
        ├── category_selector.dart  # Category filter chips
        ├── notes_list_view.dart   # Notes display with selection
        ├── note_item.dart         # Individual note widget
        └── [other widgets...]
```

### Testing

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/widget_test.dart

# Run tests with coverage
flutter test --coverage
```

### Code Generation

This project uses Hive for data persistence, which requires code generation:

```bash
# One-time generation
dart run build_runner build

# Watch for changes and regenerate
dart run build_runner watch

# Delete generated files and regenerate (use after model changes)
dart run build_runner build --delete-conflicting-outputs

# Or use the provided script
./regenerate_adapters.sh
```

## New Features Added

### Simple To-Do App Enhancement

#### Task Completion System
- **Checkbox for each task**: Tap the circle icon to mark tasks as completed or pending
- **Visual feedback**: Completed tasks show green checkmarks and strikethrough styling
- **Persistent state**: Task completion status is automatically saved and restored

#### Smart Task Filtering
- **All tasks**: View all notes regardless of completion status (default)
- **Pending tasks**: See only uncompleted tasks to focus on what needs to be done
- **Completed tasks**: Review finished tasks for satisfaction and reference
- **Combined filtering**: Works seamlessly with existing category filters

#### Enhanced User Experience
- **Intuitive design**: Clear visual distinction between completed and pending tasks
- **One-tap completion**: Quick and easy task completion with immediate visual feedback
- **Context-aware messages**: Helpful empty state messages for each filter type
- **Reduced opacity**: Completed tasks appear with reduced opacity to de-emphasize them

### Multi-Note Selection
- **Long press** any note to enter selection mode
- **Tap notes** to select/deselect while in selection mode  
- **Select All** button to select all visible notes
- **Batch delete** multiple notes at once
- **Visual feedback** with selection indicators and borders

### Category Organization
- **9 predefined categories**: Personal, Work, Shopping, Ideas, Travel, Health, Education, Finance, Other
- **Category filtering** with filter chips at the top of the notes list
- **Category selection** when creating or editing notes
- **Smart filtering**: Notes without categories appear under "Other" when that filter is selected

### Enhanced Search
- **Improved search** that looks in both title and content
- **Better UX** with proper loading states and empty state messages
- **BLoC pattern** integration for consistent state management

### Better Error Handling
- **Null-safe code** prevents crashes
- **Error states** with user-friendly messages
- **Loading indicators** for better UX
- **Success notifications** for user actions

### Development Guidelines

1. **Code Formatting**: Use `dart format` or enable format on save
2. **Analysis**: Run `flutter analyze` regularly
3. **Testing**: Write tests for new features
4. **State Management**: Use BLoC pattern for state management
5. **File Organization**: Follow the established folder structure

### Troubleshooting

#### Common Issues

1. **Build runner conflicts**
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

2. **Dependency conflicts**
   ```bash
   flutter clean
   flutter pub get
   ```

3. **iOS build issues**
   ```bash
   cd ios && pod install && cd ..
   ```

#### Platform Requirements

- **Android**: API level 21+ (Android 5.0+)
- **iOS**: iOS 12.0+

### Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests and ensure code quality
5. Submit a pull request

### License

This project is open source and available under the [MIT License](LICENSE).










