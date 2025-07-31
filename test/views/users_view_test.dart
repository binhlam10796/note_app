import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:notes_app/cubits/users_cubit/users_cubit.dart';
import 'package:notes_app/cubits/users_cubit/users_state.dart';
import 'package:notes_app/models/user_model.dart';
import 'package:notes_app/services/api_service.dart';
import 'package:notes_app/views/users_view.dart';

class MockApiService extends Mock implements ApiService {}

void main() {
  group('UsersView Widget Tests', () {
    late MockApiService mockApiService;

    setUp(() {
      mockApiService = MockApiService();
    });

    testWidgets('should show loading indicator initially', (tester) async {
      // Arrange
      when(mockApiService.getUsers(page: anyNamed('page'), perPage: anyNamed('perPage')))
          .thenAnswer((_) async => []);

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider(
            create: (context) => UsersCubit(apiService: mockApiService),
            child: const UsersView(),
          ),
        ),
      );

      // Assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should show users list when loaded', (tester) async {
      // Arrange
      final mockUsers = [
        const UserModel(
          id: 1,
          login: 'octocat',
          avatarUrl: 'https://avatars.githubusercontent.com/u/583231?v=4',
          htmlUrl: 'https://github.com/octocat',
          type: 'User',
          siteAdmin: false,
        ),
        const UserModel(
          id: 2,
          login: 'defunkt',
          avatarUrl: 'https://avatars.githubusercontent.com/u/2?v=4',
          htmlUrl: 'https://github.com/defunkt',
          type: 'User',
          siteAdmin: false,
        ),
      ];

      when(mockApiService.getUsers(page: anyNamed('page'), perPage: anyNamed('perPage')))
          .thenAnswer((_) async => mockUsers);

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider(
            create: (context) => UsersCubit(apiService: mockApiService)..fetchUsers(),
            child: const UsersView(),
          ),
        ),
      );

      await tester.pump(); // Wait for the future to complete

      // Assert
      expect(find.text('octocat'), findsOneWidget);
      expect(find.text('defunkt'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets('should show error state when loading fails', (tester) async {
      // Arrange
      when(mockApiService.getUsers(page: anyNamed('page'), perPage: anyNamed('perPage')))
          .thenThrow(const ApiException('Network error'));

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider(
            create: (context) => UsersCubit(apiService: mockApiService)..fetchUsers(),
            child: const UsersView(),
          ),
        ),
      );

      await tester.pump(); // Wait for the future to complete

      // Assert
      expect(find.text('Error'), findsOneWidget);
      expect(find.text('Network error'), findsOneWidget);
      expect(find.text('Retry'), findsOneWidget);
    });

    testWidgets('should show empty state when no users found', (tester) async {
      // Arrange
      when(mockApiService.getUsers(page: anyNamed('page'), perPage: anyNamed('perPage')))
          .thenAnswer((_) async => []);

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider(
            create: (context) => UsersCubit(apiService: mockApiService)..fetchUsers(),
            child: const UsersView(),
          ),
        ),
      );

      await tester.pump(); // Wait for the future to complete

      // Assert
      expect(find.text('No users found'), findsOneWidget);
      expect(find.text('Try adjusting your search or check your connection'), findsOneWidget);
    });

    testWidgets('should show search bar', (tester) async {
      // Arrange
      when(mockApiService.getUsers(page: anyNamed('page'), perPage: anyNamed('perPage')))
          .thenAnswer((_) async => []);

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider(
            create: (context) => UsersCubit(apiService: mockApiService),
            child: const UsersView(),
          ),
        ),
      );

      // Assert
      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('Search users...'), findsOneWidget);
    });

    testWidgets('should show sort button', (tester) async {
      // Arrange
      when(mockApiService.getUsers(page: anyNamed('page'), perPage: anyNamed('perPage')))
          .thenAnswer((_) async => []);

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider(
            create: (context) => UsersCubit(apiService: mockApiService),
            child: const UsersView(),
          ),
        ),
      );

      // Assert
      expect(find.byIcon(Icons.sort), findsOneWidget);
    });
  });
}