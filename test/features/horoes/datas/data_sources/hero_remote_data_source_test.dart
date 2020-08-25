import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertesting/app/environment.dart';
import 'package:fluttertesting/cores/exceptions/exception.dart';
import 'package:fluttertesting/features/heroes/datas/data_sources/hero_data_source.dart';
import 'package:fluttertesting/features/heroes/datas/data_sources/hero_remote_data_source.dart';
import 'package:fluttertesting/features/heroes/datas/models/hero.dart';
import 'package:mockito/mockito.dart';

class DioAdapterMock extends Mock implements HttpClientAdapter {}
class HeroDataSourceMock extends Mock implements HeroDataSource {}

void main() {
  Environment environment;
  DioAdapterMock adapterMock;
  HeroDataSource dataSource;

  setUp(() {
    environment = Environment.staging();
    adapterMock = DioAdapterMock();
    dataSource = HeroRemoteDataSource(
      baseUrl: environment.baseUrl,
      mockAdapter: adapterMock
    );
  });

  test('should return List of Dota 2 Heroes when response code is 200 (success).', () async {
    final mockData = [
      {
        "id": 1,
        "name": "npc_dota_hero_antimage",
        "localized_name": "Anti-Mage",
        "primary_attr": "agi",
        "attack_type": "Melee",
        "roles": ["Carry", "Escape", "Nuker"],
        "legs": 2
      },
      {
        "id": 2,
        "name": "npc_dota_hero_axe",
        "localized_name": "Axe",
        "primary_attr": "str",
        "attack_type": "Melee",
        "roles": ["Initiator", "Durable", "Disabler", "Jungler"],
        "legs": 2
      }
    ];
    List<HeroModel> heroModels = mockData.map((e) => HeroModel.fromJson(e)).toList();

    when(adapterMock.fetch(any, any, any))
      .thenAnswer((_) async => ResponseBody.fromString(
        jsonEncode(mockData),
        200,
        headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType]
        }
      ));

    List<HeroModel> result = await dataSource.getHeroes();

    expect(result.length, equals(heroModels.length));
  });

  test('should throw an error when response code is 500 (server failed).', () async {
    when(adapterMock.fetch(any, any, any))
      .thenAnswer((_) async => ResponseBody.fromString(
        jsonEncode({"error": "Something Went Wrong"}),
        500,
        headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType]
        }
      ));

    expect(dataSource.getHeroes(), throwsA(isInstanceOf<ServerException>()));
  });
}