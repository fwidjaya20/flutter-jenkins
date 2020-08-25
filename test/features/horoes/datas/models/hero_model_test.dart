import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertesting/features/heroes/datas/models/hero.dart';
import 'package:fluttertesting/features/heroes/domains/entities/hero.dart';

void main() {
  HeroModel model;

  setUp(() {
    model = HeroModel(
      entity: HeroEntity(
        id: 1,
        name: "npc_dota_hero_antimage",
        localizedName: "Anti-Mage",
        attackType: "melee",
        primaryAttr: "agi",
        roles: ["Carry", "Escape", "Nuker"],
        legs: 2
      )
    );
  });

  test("should contain HeroEntity", () {
    expect(model.entity, isA<HeroEntity>());
  });

  test("fromJson model should return a valid HeroModel", () async {
    final example = {
      "id": 1,
      "name": "npc_dota_hero_antimage",
      "localized_name": "Anti-Mage",
      "attack_type": "melee",
      "primary_attr": "agi",
      "roles": ["Carry", "Escape", "Nuker"],
      "legs": 2
    };

    final result = HeroModel.fromJson(example);

    expect(result.entity.id, equals(model.entity.id));
  });
}