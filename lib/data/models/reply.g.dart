// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reply.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reply _$ReplyFromJson(Map<String, dynamic> json) => Reply(
      createrId: json['createrId'] as String,
      content: json['content'] as String,
      createAt: json['createAt'] as int,
      deleteAt: json['deleteAt'] as int?,
      likeUserId: json['likeUserId'] as List<dynamic>,
      parentId: json['parentId'] as String,
    );

Map<String, dynamic> _$ReplyToJson(Reply instance) => <String, dynamic>{
      'createrId': instance.createrId,
      'content': instance.content,
      'createAt': instance.createAt,
      'deleteAt': instance.deleteAt,
      'likeUserId': instance.likeUserId,
      'parentId': instance.parentId,
    };
