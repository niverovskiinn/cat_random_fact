import 'dart:async';

import 'package:cat_random_fact/core/errors/failure.dart';
import 'package:cat_random_fact/core/errors/hive_failure.dart';
import 'package:cat_random_fact/domain/use_cases/get_random_cat_fact_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cat_random_fact/domain/entities/cat_fact.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetRandomCatFactUseCase _getRandomCatFactUseCase;
  HomeBloc(this._getRandomCatFactUseCase) : super(const HomeLoading()) {
    on<HomeInitLoadingEvent>(_downloadFact);
    on<HomeNextFactEvent>(_downloadFact);
  }

  FutureOr<void> _downloadFact(HomeEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading(state.fact));
    final either = await _getRandomCatFactUseCase.call();
    either.fold(
      (fail) => emit(HomeFailure(fail, state.fact)),
      (fact) => emit(HomeInitial(fact)),
    );
  }
}
