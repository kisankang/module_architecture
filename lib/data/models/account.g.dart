// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      id: json['id'] as String,
      isBlock: json['is_block'] as bool? ?? false,
      username: json['username'] as String?,
      nickname: json['nickname'] as String?,
      job: json['job'] as String?,
      description: json['description'] as String?,
      phone: json['phone'] as String?,
      phonePrefix: json['phone_prefix'] as String?,
      avatar: json['avatar'] as String?,
      cover: json['cover'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      loginType: json['login_type'] as String?,
      birthday: json['birthday'],
      token: json['token'] as String?,
      uuid: json['int_unique_id'] as int?,
      voipToken: json['ios_voip_token'] as String?,
      locale: json['locale'] as String?,
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'id': instance.id,
      'is_block': instance.isBlock,
      'username': instance.username,
      'nickname': instance.nickname,
      'job': instance.job,
      'description': instance.description,
      'phone': instance.phone,
      'phone_prefix': instance.phonePrefix,
      'avatar': instance.avatar,
      'cover': instance.cover,
      'email': instance.email,
      'gender': instance.gender,
      'login_type': instance.loginType,
      'birthday': instance.birthday,
      'token': instance.token,
      'int_unique_id': instance.uuid,
      'ios_voip_token': instance.voipToken,
      'locale': instance.locale,
    };
