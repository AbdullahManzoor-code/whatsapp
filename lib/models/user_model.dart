import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class Usermodel {
  Usermodel({
    required this.name,
    required this.userid,
    required this.profileurl,
    required this.online,
    required this.phonenumber,
    required this.groupid,
  });

  final String name;
  final String userid;
  final String profileurl;
  final bool online;
  final String phonenumber;
  final List<String> groupid;
  factory Usermodel.fromJson(Map<String, dynamic> json) =>
      _$UsermodelFromJson(json);
  Map<String, dynamic> toJson() => _$UsermodelToJson(this);
}
