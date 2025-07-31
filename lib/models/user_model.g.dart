// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int,
      login: json['login'] as String,
      avatarUrl: json['avatar_url'] as String,
      htmlUrl: json['html_url'] as String,
      type: json['type'] as String,
      siteAdmin: json['site_admin'] as bool,
      name: json['name'] as String?,
      email: json['email'] as String?,
      bio: json['bio'] as String?,
      publicRepos: json['public_repos'] as int?,
      followers: json['followers'] as int?,
      following: json['following'] as int?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'avatar_url': instance.avatarUrl,
      'html_url': instance.htmlUrl,
      'type': instance.type,
      'site_admin': instance.siteAdmin,
      'name': instance.name,
      'email': instance.email,
      'bio': instance.bio,
      'public_repos': instance.publicRepos,
      'followers': instance.followers,
      'following': instance.following,
      'created_at': instance.createdAt,
    };