import 'dart:async';

import 'package:cat_random_fact/domain/entities/cat_fact.dart';
import 'package:either_dart/either.dart';
import 'package:cat_random_fact/core/errors/failure.dart';

abstract class SavedCatFactsRepository {
  FutureOr<Either<Failure, void>> addFact(CatFact fact);
  FutureOr<Either<Failure, void>> deleteFact(String id);
  FutureOr<Either<Failure, List<CatFact>>> getAll();
  FutureOr<Either<Failure, CatFact?>> getById(String id);
}
