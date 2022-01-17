class Working {
  Working({
    this.id,
    this.name,
    this.address,
    this.catchPhrase,
    this.businessSegment,
  });

  factory Working.fromJson(Map<String, dynamic> json) => Working(
    id: json["id"],
    name: json["name"],
    address: json["address"],
    catchPhrase: json["catchPhrase"],
    businessSegment: json["bs"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "address": address,
    "catchPhrase": catchPhrase,
    "bs": businessSegment,
  };

  final int? id;
  final String? name;
  final String? address;
  final String? catchPhrase;
  final String? businessSegment;
}