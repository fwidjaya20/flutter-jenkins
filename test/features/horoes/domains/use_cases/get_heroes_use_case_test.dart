import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertesting/cores/domains/use_case/use_case.dart';
import 'package:fluttertesting/features/heroes/domains/entities/hero.dart';
import 'package:fluttertesting/features/heroes/domains/repository/hero_repository.dart';
import 'package:fluttertesting/features/heroes/domains/use_cases/get_heroes_use_case.dart';
import 'package:mockito/mockito.dart';

class HeroRepositoryMock extends Mock implements HeroRepository {}

void main() {
  GetHeroesUseCase getHeroes;
  HeroRepositoryMock repositoryMock;

  setUp(() {
    repositoryMock = HeroRepositoryMock();
    getHeroes = GetHeroesUseCase(
      repository: repositoryMock
    );
  });

  test("should get a dota 2 heroes from the repository", () async {
    List<HeroEntity> mockData = [
      HeroEntity(
        id: 1,
        name: "npc_dota_hero_antimage",
        localizedName: "Anti-Mage",
        attackType: "melee",
        primaryAttr: "agi",
        roles: ["Carry", "Escape", "Nuker"],
        legs: 2
      )
    ];

    when(repositoryMock.getHeroes())
      .thenAnswer((realInvocation) async => Right(mockData));

    final result = await getHeroes(NoParams());

    expect(result, Right(mockData));
  });
}