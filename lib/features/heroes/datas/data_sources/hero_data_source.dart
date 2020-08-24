import 'package:fluttertesting/features/heroes/datas/models/hero.dart';

abstract class HeroDataSource {
  Future<List<HeroModel>> getHeroes();
}