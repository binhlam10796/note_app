# NotesHub

**Notes app made using Flutter with Hive**

## Features 
- ✍️ Craft & Revise Notes Easily: Create and adjust your thoughts with simplicity.
- 🔍 Rapid Search: Quickly locate your notes using the robust search function.
- ⌚️ Timestamps: Every note is marked with its creation date and time.
- 🎨 Customizable Colors: Personalize your notes with different color themes.
- 📱 Cross-platform: Works on Android and iOS devices.

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
├── constants.dart           # App constants
├── simple_bloc_observer.dart # BLoC observer
├── cubits/                  # State management
│   ├── add_note_cubit/
│   └── notes_cubit/
├── models/                  # Data models
│   ├── note_model.dart
│   └── note_model.g.dart   # Generated Hive adapter
└── views/                   # UI screens and widgets
    ├── notes_view.dart
    ├── edit_note_view.dart
    ├── search_view.dart
    └── widgets/            # Reusable widgets
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

# Delete generated files and regenerate
dart run build_runner build --delete-conflicting-outputs
```

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










