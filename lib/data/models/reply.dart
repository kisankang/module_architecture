import 'package:json_annotation/json_annotation.dart';

part 'reply.g.dart';

@JsonSerializable()
class Reply {
  final String createrId;
  final String content;
  final int createAt;
  final int? deleteAt;
  final List likeUserId;
  String get id => createAt.toString();
  final String parentId;

  Reply({
    required this.createrId,
    required this.content,
    required this.createAt,
    required this.deleteAt,
    required this.likeUserId,
    required this.parentId,
  });

  factory Reply.fromJson(Map<String, dynamic> json) => _$ReplyFromJson(json);
  Map<String, dynamic> toJson() => _$ReplyToJson(this);
}
