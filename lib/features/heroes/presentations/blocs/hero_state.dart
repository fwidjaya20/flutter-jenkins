import 'package:fluttertesting/cores/failure/failure.dart';
import 'package:fluttertesting/features/heroes/domains/entities/hero.dart';
import 'package:meta/meta.dart';

abstract class HeroState {}

class HeroUninitialized extends HeroState {}

class HeroLoading extends HeroState {}

class HeroLoaded extends HeroState {
  final List<HeroEntity> heroes;

  HeroLoaded({
    this.heroes
  });

  HeroLoaded copyWith({
    List<HeroEntity> heroes
  }) {
    return HeroLoaded(
      heroes: heroes ?? this.heroes
    );
  }
}

class HeroError extends HeroState {
  final Failure failure;

  HeroError({@required this.failure});
}