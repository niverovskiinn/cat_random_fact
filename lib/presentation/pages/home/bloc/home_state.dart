part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  final CatFact? fact;
  const HomeState(this.fact);

  @override
  List<Object?> get props => [fact];
}

class HomeInitial extends HomeState {
  const HomeInitial([super.fact]);
}

class HomeLoading extends HomeState {
  const HomeLoading([super.fact]);
}

class HomeFailure extends HomeState {
  final Failure fail;
  const HomeFailure(this.fail, [super.fact]);
  @override
  List<Object?> get props => [fail];
}
