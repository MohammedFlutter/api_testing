
// "id": 1,

import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';


@JsonSerializable()
class User{
  int? id;
  String? name ;
  String? username ;
  String? email ;

  User({this.id, this.name, this.username, this.email});
  factory User.fromJson(Map<String,dynamic> json)=>_$UserFromJson(json);
  Map<String,dynamic> toJson()=>_$UserToJson(this);
}