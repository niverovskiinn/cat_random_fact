import 'package:cat_random_fact/data/models/cat_fact.dart';
import 'package:dio/dio.dart';
import 'package:cat_random_fact/data/network/base/base_api.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'cat_facts_api.g.dart';

@RestApi()
@singleton
abstract class CatFactsApi extends BaseApi {
  @factoryMethod
  factory CatFactsApi(Dio dio) = _CatFactsApi;

  @GET('/facts/random')
  Future<CatFactModel> getRandomFact();
}
