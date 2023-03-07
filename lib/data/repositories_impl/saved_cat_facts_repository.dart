import 'dart:async';

import 'package:cat_random_fact/data/models/cat_fact.dart';
import 'package:cat_random_fact/domain/entities/cat_fact.dart';
import 'package:cat_random_fact/domain/repositories/saved_cat_facts_repository.dart';
import 'package:either_dart/either.dart';
import 'package:cat_random_fact/core/errors/failure.dart';
import 'package:cat_random_fact/data/local/hive_local_storage.dart';
import 'package:cat_random_fact/utils/errors_handler.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: SavedCatFactsRepository)
class SavedCatFactsRepositoryHiveImpl implements SavedCatFactsRepository {
  final HiveBoxLocalStorage<CatFactModel> _hiveBox;
  final ErrorHandler _errorHandler;

  SavedCatFactsRepositoryHiveImpl(this._hiveBox, this._errorHandler);

  @override
  FutureOr<Either<Failure, void>> addFact(CatFact fact) async {
    try {
      return Right(await _hiveBox.add(fact.id, fact.toModel()));
    } catch (e) {
      return Left(_errorHandler.handle(e));
    }
  }

  @override
  FutureOr<Either<Failure, void>> deleteFact(String id) async {
    try {
      return Right(await _hiveBox.delete(id));
    } catch (e) {
      return Left(_errorHandler.handle(e));
    }
  }

  @override
  FutureOr<Either<Failure, List<CatFact>>> getAll() async {
    try {
      return Right(_hiveBox.getAll().map((e) => CatFact.fromModel(e)).toList());
    } catch (e) {
      return Left(_errorHandler.handle(e));
    }
  }

  @override
  FutureOr<Either<Failure, CatFact?>> getById(String id) async {
    try {
      final res = _hiveBox.getById(id: id);
      return Right(res != null ? CatFact.fromModel(res) : null);
    } catch (e) {
      return Left(_errorHandler.handle(e));
    }
  }
}
