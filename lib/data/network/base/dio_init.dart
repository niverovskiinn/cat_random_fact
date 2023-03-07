import 'package:dio/dio.dart';
import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';
import 'package:cat_random_fact/utils/configs.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioModule {
  @singleton
  Dio get dio {
    final dio = Dio(BaseOptions(baseUrl: AppConfigs.apiUrl));
    dio.interceptors.add(PrettyDioLogger(
      canShowLog: true,
      queryParameters: true,
      requestBody: false,
    ));

    return dio;
  }
}
