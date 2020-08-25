import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertesting/features/heroes/domains/entities/hero.dart';
import 'package:fluttertesting/features/heroes/domains/use_cases/get_heroes_use_case.dart';
import 'package:fluttertesting/features/heroes/presentations/blocs/hero_bloc.dart';
import 'package:fluttertesting/features/heroes/presentations/blocs/hero_event.dart';
import 'package:fluttertesting/features/heroes/presentations/blocs/hero_state.dart';
import 'package:mockito/mockito.dart';

class GetHeroesUseCaseMock extends Mock implements GetHeroesUseCase {}

void main() {
  GetHeroesUseCaseMock getHeroesUseCaseMock;

  setUp(() {
    getHeroesUseCaseMock = GetHeroesUseCaseMock();
  });

  test("Initial state should be HeroUninitialized", () {
    final HeroBloc bloc = HeroBloc(
      getHeroesUseCase: getHeroesUseCaseMock
    );
    expect(bloc, isA<HeroUninitialized>());
    bloc.close();
  });

  test("Should emit [HeroLoading, HeroLoaded] when fire FetchHero", () {
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

    when(getHeroesUseCaseMock(any))
      .thenAnswer((_) async => Right(mockData));

    final bloc = HeroBloc(
      getHeroesUseCase: getHeroesUseCaseMock
    );
    final expected = [
      HeroLoading(),
      HeroLoaded(
        heroes: mockData
      )
    ];

    expectLater(bloc, emitsInOrder(expected));

    bloc.add(FetchHeroes());
  });
}