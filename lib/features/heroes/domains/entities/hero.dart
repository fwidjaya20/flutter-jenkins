import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class HeroEntity extends Equatable {
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

  @override
  List<Object> get props => [
    id,
    name,
    localizedName,
    primaryAttr,
    attackType,
    roles,
    legs
  ];
}