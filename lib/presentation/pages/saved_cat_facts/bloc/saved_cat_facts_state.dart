part of 'saved_cat_facts_bloc.dart';

abstract class SavedCatFactsState extends Equatable {
  const SavedCatFactsState();

  @override
  List<Object> get props => [];
}

class SavedCatFactsLoading extends SavedCatFactsState {
  const SavedCatFactsLoading();
}

class SavedCatFactsLoaded extends SavedCatFactsState {
  final List<CatFact> items;

  const SavedCatFactsLoaded(this.items);
  @override
  List<Object> get props => [items];
}

class SavedCatFactsFailure extends SavedCatFactsState {
  final Failure failure;

  const SavedCatFactsFailure(this.failure);

  @override
  List<Object> get props => [failure];
}
