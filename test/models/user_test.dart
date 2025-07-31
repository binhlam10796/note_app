import 'package:flutter_test/flutter_test.dart';
import 'package:notes_app/models/user_model.dart';

void main() {
  group('UserModel', () {
    test('should create a UserModel from JSON', () {
      // Arrange
      final json = {
        'id': 1,
        'login': 'octocat',
        'avatar_url': 'https://github.com/images/error/octocat_happy.gif',
        'html_url': 'https://github.com/octocat',
        'type': 'User',
        'site_admin': false,
        'name': 'The Octocat',
        'email': 'octocat@github.com',
        'bio': 'A great bio',
        'public_repos': 2,
        'followers': 20,
        'following': 0,
        'created_at': '2008-01-14T04:33:35Z',
      };

      // Act
      final user = UserModel.fromJson(json);

      // Assert
      expect(user.id, 1);
      expect(user.login, 'octocat');
      expect(user.avatarUrl, 'https://github.com/images/error/octocat_happy.gif');
      expect(user.htmlUrl, 'https://github.com/octocat');
      expect(user.type, 'User');
      expect(user.siteAdmin, false);
      expect(user.name, 'The Octocat');
      expect(user.email, 'octocat@github.com');
      expect(user.bio, 'A great bio');
      expect(user.publicRepos, 2);
      expect(user.followers, 20);
      expect(user.following, 0);
      expect(user.createdAt, '2008-01-14T04:33:35Z');
    });

    test('should create a UserModel with minimal required fields', () {
      // Arrange
      final json = {
        'id': 1,
        'login': 'octocat',
        'avatar_url': 'https://github.com/images/error/octocat_happy.gif',
        'html_url': 'https://github.com/octocat',
        'type': 'User',
        'site_admin': false,
      };

      // Act
      final user = UserModel.fromJson(json);

      // Assert
      expect(user.id, 1);
      expect(user.login, 'octocat');
      expect(user.avatarUrl, 'https://github.com/images/error/octocat_happy.gif');
      expect(user.htmlUrl, 'https://github.com/octocat');
      expect(user.type, 'User');
      expect(user.siteAdmin, false);
      expect(user.name, null);
      expect(user.email, null);
      expect(user.bio, null);
      expect(user.publicRepos, null);
      expect(user.followers, null);
      expect(user.following, null);
      expect(user.createdAt, null);
    });

    test('should convert UserModel to JSON', () {
      // Arrange
      const user = UserModel(
        id: 1,
        login: 'octocat',
        avatarUrl: 'https://github.com/images/error/octocat_happy.gif',
        htmlUrl: 'https://github.com/octocat',
        type: 'User',
        siteAdmin: false,
        name: 'The Octocat',
        email: 'octocat@github.com',
      );

      // Act
      final json = user.toJson();

      // Assert
      expect(json['id'], 1);
      expect(json['login'], 'octocat');
      expect(json['avatar_url'], 'https://github.com/images/error/octocat_happy.gif');
      expect(json['html_url'], 'https://github.com/octocat');
      expect(json['type'], 'User');
      expect(json['site_admin'], false);
      expect(json['name'], 'The Octocat');
      expect(json['email'], 'octocat@github.com');
    });

    test('should support equality comparison', () {
      // Arrange
      const user1 = UserModel(
        id: 1,
        login: 'octocat',
        avatarUrl: 'https://github.com/images/error/octocat_happy.gif',
        htmlUrl: 'https://github.com/octocat',
        type: 'User',
        siteAdmin: false,
      );

      const user2 = UserModel(
        id: 1,
        login: 'octocat',
        avatarUrl: 'https://github.com/images/error/octocat_happy.gif',
        htmlUrl: 'https://github.com/octocat',
        type: 'User',
        siteAdmin: false,
      );

      const user3 = UserModel(
        id: 2,
        login: 'different',
        avatarUrl: 'https://github.com/images/error/octocat_happy.gif',
        htmlUrl: 'https://github.com/different',
        type: 'User',
        siteAdmin: false,
      );

      // Assert
      expect(user1, equals(user2));
      expect(user1, isNot(equals(user3)));
    });
  });
}