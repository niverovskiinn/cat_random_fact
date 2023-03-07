import 'dart:async';

import 'package:cat_random_fact/domain/entities/cat_fact.dart';
import 'package:either_dart/either.dart';
import 'package:cat_random_fact/core/errors/failure.dart';

abstract class CatFactsRepository {
  Future<Either<Failure, CatFact>> getRandomFact();
}
