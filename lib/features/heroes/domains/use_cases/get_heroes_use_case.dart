import 'package:dartz/dartz.dart';
import 'package:fluttertesting/cores/domains/use_case/use_case.dart';
import 'package:fluttertesting/cores/failure/failure.dart';
import 'package:fluttertesting/features/heroes/domains/entities/hero.dart';
import 'package:fluttertesting/features/heroes/domains/repository/hero_repository.dart';
import 'package:meta/meta.dart';

class GetHeroesUseCase extends UseCase<List<HeroEntity>, NoParams> {
  final HeroRepository _repository;

  GetHeroesUseCase({
    @required HeroRepository repository
  }) : this._repository = repository;


  @override
  Future<Either<Failure, List<HeroEntity>>> call(NoParams params) async {
    return await this._repository.getHeroes();
  }
}