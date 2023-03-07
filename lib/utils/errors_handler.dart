import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:cat_random_fact/core/errors/failure.dart';
import 'package:cat_random_fact/core/errors/network_failure.dart';
import 'package:cat_random_fact/core/errors/unknown_failure.dart';
import 'package:cat_random_fact/core/errors/hive_failure.dart';
import 'package:cat_random_fact/resourses/strings.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@singleton
class ErrorHandler {
  Failure get unknownFailure => UnknownFailure(AppStrings.unknownError);

  Failure handleDioError(DioError err) {
    return NetworkFailure(err.response?.data['message'] ?? err.message);
  }

  Failure handleHiveError(HiveError e) => HiveFailure(e.message);

  Failure handleDartException(Exception e) {
    var eMessage = e.toString();
    return eMessage.length > "Exception".length
        ? UnknownFailure(eMessage.substring("Exception: ".length))
        : unknownFailure;
  }

  Failure handleDartError(Error e) {
    return unknownFailure;
  }

  Failure handle(e) {
    log("ErrorHandler.handle", error: e);
    if (e is DioError) {
      return handleDioError(e);
    }
    if (e is HiveError) {
      return handleHiveError(e);
    }
    if (e is Exception) {
      return handleDartException(e);
    }
    if (e is Error) {
      return handleDartError(e);
    }
    return unknownFailure;
  }
}
