// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      createrId: json['createrId'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      createAt: json['createAt'] as int,
      deleteAt: json['deleteAt'] as int?,
      replies: json['replies'] as List<dynamic>,
      likeUserId: json['likeUserId'] as List<dynamic>,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'createrId': instance.createrId,
      'title': instance.title,
      'content': instance.content,
      'createAt': instance.createAt,
      'deleteAt': instance.deleteAt,
      'replies': instance.replies,
      'likeUserId': instance.likeUserId,
    };
