import 'package:json_annotation/json_annotation.dart';

part 'chat_contact_info.g.dart'; // Generated file will have this name

@JsonSerializable()
class Chatcontactinfo {
  Chatcontactinfo({
    required this.name,
    required this.profilepic,
    required this.contactid,
    required this.lastmsg,
    required this.time,
  });

  String name;
  String profilepic;
  String contactid;
  String lastmsg;
  DateTime time;

  factory Chatcontactinfo.fromJson(Map<String, dynamic> json) =>
      _$ChatcontactinfoFromJson(json);

  Map<String, dynamic> toJson() => _$ChatcontactinfoToJson(this);
}
