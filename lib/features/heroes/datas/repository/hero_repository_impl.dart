import 'package:dartz/dartz.dart';
import 'package:fluttertesting/cores/failure/failure.dart';
import 'package:fluttertesting/features/heroes/datas/data_sources/hero_data_source.dart';
import 'package:fluttertesting/features/heroes/domains/entities/hero.dart';
import 'package:fluttertesting/features/heroes/domains/repository/hero_repository.dart';
import 'package:meta/meta.dart';

class HeroRepositoryImpl implements HeroRepository {
  final HeroDataSource _dataSource;

  HeroRepositoryImpl({
    @required HeroDataSource dataSource
  }) : this._dataSource = dataSource;

  @override
  Future<Either<Failure, List<HeroEntity>>> getHeroes() async {
    try {
      final result = await this._dataSource.getHeroes();

      List<HeroEntity> entities = List<HeroEntity>();

      if (result != null) {
        entities = result.map((e) => e.entity).toList();
      }

      return Right(entities);
    } catch(e) {
      return Left(ServerFailure());
    }
  }
}