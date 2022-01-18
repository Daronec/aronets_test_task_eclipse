import 'dart:convert';

import 'package:aronets_test_task_eclipse/data/models/comment_model.dart';
import 'package:hive/hive.dart';

part 'post_model.g.dart';

@HiveType(typeId: 3)
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
        comments: json["comments"] == null
            ? null
            : List<CommentModel>.from(
                json["comments"].map((x) => CommentModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
        "comments": comments == null
            ? null
            : List<dynamic>.from(comments!.map((x) => x.toJson())),
      };

  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final String? image;
  @HiveField(4)
  final List<CommentModel>? comments;
}

List<PostModel> postListModelFromJson(String str) =>
    List<PostModel>.from(json.decode(str).map((x) => PostModel.fromJson(x)));
PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(List<PostModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
