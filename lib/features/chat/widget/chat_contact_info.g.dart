// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_contact_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chatcontactinfo _$ChatcontactinfoFromJson(Map<String, dynamic> json) =>
    Chatcontactinfo(
      name: json['name'] as String,
      profilepic: json['profilepic'] as String,
      contactid: json['contactid'] as String,
      lastmsg: json['lastmsg'] as String,
      time: DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$ChatcontactinfoToJson(Chatcontactinfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'profilepic': instance.profilepic,
      'contactid': instance.contactid,
      'lastmsg': instance.lastmsg,
      'time': instance.time.toIso8601String(),
    };
