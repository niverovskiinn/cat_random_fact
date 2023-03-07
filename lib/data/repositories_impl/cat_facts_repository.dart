import 'dart:async';

import 'package:cat_random_fact/domain/entities/cat_fact.dart';
import 'package:cat_random_fact/domain/repositories/cat_facts_repository.dart';
import 'package:either_dart/either.dart';
import 'package:cat_random_fact/core/errors/failure.dart';
import 'package:cat_random_fact/data/network/cat_facts_api.dart';
import 'package:cat_random_fact/utils/errors_handler.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: CatFactsRepository)
class CatFactsRepositoryImpl implements CatFactsRepository {
  final CatFactsApi _api;
  final ErrorHandler _errorHandler;

  CatFactsRepositoryImpl(this._api, this._errorHandler);

  @override
  Future<Either<Failure, CatFact>> getRandomFact() async {
    try {
      final resp = await _api.getRandomFact();
      return Right(CatFact.fromModel(resp));
    } catch (e) {
      return Left(_errorHandler.handle(e));
    }
  }
}
