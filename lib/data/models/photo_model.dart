// To parse this JSON data, do
//
//     final photosModel = photosModelFromJson(jsonString);

import 'dart:convert';


List<AlbumsModel> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<AlbumsModel>((json) => AlbumsModel.fromJson(json)).toList();
}

AlbumsModel photoModelFromJson(String str) =>
    AlbumsModel.fromJson(json.decode(str));

String photoModelToJson(List<AlbumsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AlbumsModel {
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

  final int? id;
  final List<String>? photos;
  final String? description;
}
