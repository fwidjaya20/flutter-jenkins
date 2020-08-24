import 'package:meta/meta.dart';

class HeroEntity {
  final int id;
  final String name;
  final String localizedName;
  final String primaryAttr;
  final String attackType;
  final List<String> roles;
  final int legs;

  HeroEntity({
    @required this.id,
    @required this.name,
    @required this.localizedName,
    @required this.primaryAttr,
    @required this.attackType,
    @required this.roles,
    @required this.legs
  });
}