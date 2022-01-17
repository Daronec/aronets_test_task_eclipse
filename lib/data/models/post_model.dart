// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';

import 'package:aronets_test_task_eclipse/data/models/comment_model.dart';

List<PostModel> postListModelFromJson(String str) => List<PostModel>.from(json.decode(str).map((x) => PostModel.fromJson(x)));
PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(List<PostModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostModel {
  PostModel({
    this.id,
    this.title,
    this.description,
    this.image,
    this.comments,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    image: json["image"],
    comments: json["comments"] == null ? null : List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "image": image,
    "comments": comments == null ? null : List<dynamic>.from(comments!.map((x) => x.toJson())),
  };

  final int? id;
  final String? title;
  final String? description;
  final String? image;
  final List<Comment>? comments;
}


