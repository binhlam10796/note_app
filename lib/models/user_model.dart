import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends Equatable {
  final int id;
  final String login;
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;
  @JsonKey(name: 'html_url')
  final String htmlUrl;
  final String type;
  @JsonKey(name: 'site_admin')
  final bool siteAdmin;
  final String? name;
  final String? email;
  final String? bio;
  @JsonKey(name: 'public_repos')
  final int? publicRepos;
  final int? followers;
  final int? following;
  @JsonKey(name: 'created_at')
  final String? createdAt;

  const UserModel({
    required this.id,
    required this.login,
    required this.avatarUrl,
    required this.htmlUrl,
    required this.type,
    required this.siteAdmin,
    this.name,
    this.email,
    this.bio,
    this.publicRepos,
    this.followers,
    this.following,
    this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        login,
        avatarUrl,
        htmlUrl,
        type,
        siteAdmin,
        name,
        email,
        bio,
        publicRepos,
        followers,
        following,
        createdAt,
      ];
}