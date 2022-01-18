import 'dart:convert';

import 'package:hive/hive.dart';

part 'album_model.g.dart';

List<AlbumsModel> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<AlbumsModel>((json) => AlbumsModel.fromJson(json)).toList();
}

AlbumsModel photoModelFromJson(String str) =>
    AlbumsModel.fromJson(json.decode(str));

String photoModelToJson(List<AlbumsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: 1)
class AlbumsModel extends HiveObject {
  AlbumsModel({
    this.id,
    this.photos,
    this.description,
  });

  factory AlbumsModel.fromJson(Map<String, dynamic> json) => AlbumsModel(
        id: json["id"],
        photos: List<String>.from(json["photos"].map((x) => x)),
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "photos": List<dynamic>.from(photos!.map((x) => x)),
        "description": description,
      };

  @HiveField(0)
  final int? id;
  @HiveField(1)
  final List<String>? photos;
  @HiveField(2)
  final String? description;
}
