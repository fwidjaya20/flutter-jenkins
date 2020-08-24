import 'package:dartz/dartz.dart';
import 'package:fluttertesting/cores/failure/failure.dart';
import 'package:fluttertesting/features/heroes/domains/entities/hero.dart';

abstract class HeroRepository {
  Future<Either<Failure, List<HeroEntity>>> getHeroes();
}