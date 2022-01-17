// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import 'package:aronets_test_task_eclipse/data/models/working_model.dart';

List<UserModel> userListModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    this.id,
    this.username,
    this.name,
    this.email,
    this.phone,
    this.website,
    this.photo,
    this.working,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        username: json["username"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        website: json["website"],
        photo: json["photo"],
        working: Working.fromJson(json["working"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "name": name,
        "email": email,
        "phone": phone,
        "website": website,
        "photo": photo,
        "working": working!.toJson(),
      };

  final int? id;
  final String? username;
  final String? name;
  final String? email;
  final String? phone;
  final String? website;
  final String? photo;
  final Working? working;
}
