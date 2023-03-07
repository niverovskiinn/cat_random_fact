part of 'splash_bloc.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class SplashLoading extends SplashState {
  const SplashLoading();
}

class SplashSuccess extends SplashState {
  const SplashSuccess();
}
