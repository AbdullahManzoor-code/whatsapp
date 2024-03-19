// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Usermodel _$UsermodelFromJson(Map<String, dynamic> json) => Usermodel(
      name: json['name'] as String,
      userid: json['userid'] as String,
      profileurl: json['profileurl'] as String,
      online: json['online'] as bool,
      phonenumber: json['phonenumber'] as String,
      groupid:
          (json['groupid'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UsermodelToJson(Usermodel instance) => <String, dynamic>{
      'name': instance.name,
      'userid': instance.userid,
      'profileurl': instance.profileurl,
      'online': instance.online,
      'phonenumber': instance.phonenumber,
      'groupid': instance.groupid,
    };
