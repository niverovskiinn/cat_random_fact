import 'dart:async';

import 'package:cat_random_fact/core/errors/failure.dart';
import 'package:cat_random_fact/domain/entities/cat_fact.dart';
import 'package:cat_random_fact/domain/repositories/saved_cat_facts_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'saved_cat_facts_event.dart';
part 'saved_cat_facts_state.dart';

class SavedCatFactsBloc extends Bloc<SavedCatFactsEvent, SavedCatFactsState> {
  final SavedCatFactsRepository _repository;
  SavedCatFactsBloc(this._repository) : super(const SavedCatFactsLoading()) {
    on<SavedCatFactsInitialLoadingEvent>(_initialLoading);
  }

  FutureOr<void> _initialLoading(
      SavedCatFactsEvent event, Emitter<SavedCatFactsState> emit) async {
    final either = await _repository.getAll();
    either.fold(
      (fail) => emit(SavedCatFactsFailure(fail)),
      (items) => emit(SavedCatFactsLoaded(items)),
    );
  }
}
