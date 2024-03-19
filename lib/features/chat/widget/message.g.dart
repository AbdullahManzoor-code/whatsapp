// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      type: $enumDecode(_$MessagetypeEnumMap, json['type']),
      text: json['text'] as String,
      messageid: json['messageid'] as String,
      senderid: json['senderid'] as String,
      receiverid: json['receiverid'] as String,
      timesent: DateTime.parse(json['timesent'] as String),
      isseen: json['isseen'] as bool,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'type': _$MessagetypeEnumMap[instance.type]!,
      'text': instance.text,
      'messageid': instance.messageid,
      'senderid': instance.senderid,
      'receiverid': instance.receiverid,
      'timesent': instance.timesent.toIso8601String(),
      'isseen': instance.isseen,
    };

const _$MessagetypeEnumMap = {
  Messagetype.text: 'text',
  Messagetype.audio: 'audio',
  Messagetype.vedio: 'vedio',
  Messagetype.gif: 'gif',
  Messagetype.image: 'image',
};
