import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  final String createrId;
  final String title;
  final String content;
  final int createAt;
  final int? deleteAt;
  final List replies;
  final List likeUserId;
  String get id => createAt.toString();
  Post({
    required this.createrId,
    required this.title,
    required this.content,
    required this.createAt,
    required this.deleteAt,
    required this.replies,
    required this.likeUserId,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
