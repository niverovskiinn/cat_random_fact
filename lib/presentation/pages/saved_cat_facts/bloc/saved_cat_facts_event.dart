part of 'saved_cat_facts_bloc.dart';

abstract class SavedCatFactsEvent extends Equatable {
  const SavedCatFactsEvent();

  @override
  List<Object> get props => [];
}

class SavedCatFactsInitialLoadingEvent extends SavedCatFactsEvent {}
