class Comment {
  Comment({
    this.id,
    this.name,
    this.email,
    this.comment,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    comment: json["comment"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "comment": comment,
  };

  final int? id;
  final String? name;
  final String? email;
  final String? comment;
}