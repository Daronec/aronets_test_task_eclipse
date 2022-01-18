import 'package:hive/hive.dart';

part 'working_model.g.dart';

@HiveType(typeId: 5)
class WorkingModel {
  WorkingModel({
    this.id,
    this.name,
    this.address,
    this.catchPhrase,
    this.businessSegment,
  });

  factory WorkingModel.fromJson(Map<String, dynamic> json) => WorkingModel(
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

  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? address;
  @HiveField(3)
  final String? catchPhrase;
  @HiveField(4)
  final String? businessSegment;
}
