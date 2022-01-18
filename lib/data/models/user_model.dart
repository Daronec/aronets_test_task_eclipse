import 'dart:convert';

import 'package:aronets_test_task_eclipse/data/models/working_model.dart';
import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 4)
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
        working: WorkingModel.fromJson(json["working"]),
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

  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? username;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  final String? email;
  @HiveField(4)
  final String? phone;
  @HiveField(5)
  final String? website;
  @HiveField(6)
  final String? photo;
  @HiveField(7)
  final WorkingModel? working;
}

List<UserModel> userListModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
