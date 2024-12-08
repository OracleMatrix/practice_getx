// To parse this JSON data, do
//
//     final currentUserData = currentUserDataFromJson(jsonString);

import 'dart:convert';

CurrentUserData currentUserDataFromJson(String str) =>
    CurrentUserData.fromJson(json.decode(str));

String currentUserDataToJson(CurrentUserData data) =>
    json.encode(data.toJson());

class CurrentUserData {
  int? id;
  String? email;
  String? password;
  String? name;
  String? role;
  String? avatar;

  CurrentUserData({
    this.id,
    this.email,
    this.password,
    this.name,
    this.role,
    this.avatar,
  });

  factory CurrentUserData.fromJson(Map<String, dynamic> json) =>
      CurrentUserData(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        name: json["name"],
        role: json["role"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
        "name": name,
        "role": role,
        "avatar": avatar,
      };
}
