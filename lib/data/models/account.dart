import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

@JsonSerializable()
class Account {
  String id;
  @JsonKey(name: "is_block", defaultValue: false)
  bool? isBlock;
  String? username;
  String? nickname;
  String? job;
  String? description;
  String? phone;
  @JsonKey(name: "phone_prefix")
  String? phonePrefix;
  String? avatar;
  String? cover;
  String? email;
  String? gender;
  @JsonKey(name: 'login_type')
  String? loginType;
  dynamic birthday;
  String? token;
  @JsonKey(name: 'int_unique_id')
  int? uuid;
  @JsonKey(name: 'ios_voip_token')
  String? voipToken;
  String? locale;

  Account({
    required this.id,
    this.isBlock,
    this.username,
    this.nickname,
    this.job,
    this.description,
    this.phone,
    this.phonePrefix,
    this.avatar,
    this.cover,
    this.email,
    this.gender,
    this.loginType,
    this.birthday,
    this.token,
    this.uuid,
    this.voipToken,
    this.locale,
  });

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
  Map<String, dynamic> toJson() => _$AccountToJson(this);

  Account copyWith({
    String? id,
    bool? isBlock,
    String? username,
    String? nickname,
    String? job,
    String? description,
    String? phone,
    String? phonePrefix,
    String? avatar,
    String? cover,
    String? email,
    String? gender,
    String? loginType,
    dynamic birthday,
    String? token,
    int? uuid,
    String? voipToken,
    String? locale,
  }) {
    return Account(
      id: id ?? this.id,
      isBlock: isBlock ?? this.isBlock,
      username: username ?? this.username,
      nickname: nickname ?? this.nickname,
      job: job ?? this.job,
      description: description ?? this.description,
      phone: phone ?? this.phone,
      phonePrefix: phonePrefix ?? this.phonePrefix,
      avatar: avatar ?? this.avatar,
      cover: cover ?? this.cover,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      loginType: loginType ?? this.loginType,
      birthday: birthday ?? this.birthday,
      token: token ?? this.token,
      uuid: uuid ?? this.uuid,
      voipToken: voipToken ?? this.voipToken,
      locale: locale ?? this.locale,
    );
  }
}
