import 'package:json_annotation/json_annotation.dart';
import 'package:whatsapp/features/common/enums/msg_enum.dart'; // Import your Messagetype enum

part 'message.g.dart';

@JsonSerializable()
class Message {
  Message({
    required this.type,
    required this.text,
    required this.messageid,
    required this.senderid,
    required this.receiverid,
    required this.timesent,
    required this.isseen,
  });

  final Messagetype type;
  final String text;
  final String messageid;
  final String senderid;
  final String receiverid;
  final DateTime timesent;
  final bool isseen;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
