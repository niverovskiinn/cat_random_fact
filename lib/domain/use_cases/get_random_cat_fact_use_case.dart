import 'package:cat_random_fact/core/errors/failure.dart';
import 'package:cat_random_fact/domain/entities/cat_fact.dart';
import 'package:cat_random_fact/domain/repositories/cat_facts_repository.dart';
import 'package:cat_random_fact/domain/repositories/saved_cat_facts_repository.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetRandomCatFactUseCase {
  final CatFactsRepository _repository;
  final SavedCatFactsRepository _savedCatFactsRepository;

  GetRandomCatFactUseCase(this._repository, this._savedCatFactsRepository);

  Future<Either<Failure, CatFact>> call() async {
    final either = await _repository.getRandomFact();
    if (either.isRight) {
      await _savedCatFactsRepository.addFact(either.right);
    }
    return either;
  }
}
