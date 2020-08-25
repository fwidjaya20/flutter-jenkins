import 'package:dio/dio.dart';
import 'package:fluttertesting/cores/http_client/http_client.dart';
import 'package:fluttertesting/features/heroes/datas/data_sources/hero_data_source.dart';
import 'package:fluttertesting/features/heroes/datas/models/hero.dart';
import 'package:meta/meta.dart';

class HeroRemoteDataSource extends HttpClient implements HeroDataSource {
  String baseUrl;

  HeroRemoteDataSource({
    @required this.baseUrl,
    HttpClientAdapter mockAdapter
  }) : super(baseUrl: baseUrl, adapter: mockAdapter);

  @override
  Future<List<HeroModel>> getHeroes() async {
    try {
      var jsonResult = await this.request(method: HttpMethod.GET, path: "/heroes");

      List<HeroModel> results = List<HeroModel>();
      if (jsonResult != null) {
        List<dynamic> datum = (jsonResult as Response<dynamic>).data;
        results = datum.map((e) {
          return HeroModel.fromJson(e);
        }).toList();
      }

      return results;
    } catch(e) {
      throw e;
    }
  }
}