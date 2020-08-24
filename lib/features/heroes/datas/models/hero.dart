import 'package:fluttertesting/features/heroes/domains/entities/hero.dart';
import 'package:meta/meta.dart';

class HeroModel {
  final HeroEntity entity;

  HeroModel({
    @required this.entity
  });

  factory HeroModel.fromJson(Map<String, dynamic> json) {
    return HeroModel(
      entity: HeroEntity(
        id: json["id"],
        name: json["name"],
        localizedName: json["localized_name"],
        primaryAttr: json["primary_attr"],
        attackType: json["attack_type"],
        roles: (json["roles"] as List).map((e) => e.toString()).toList(),
        legs: json["legs"],
      )
    );
  }
}