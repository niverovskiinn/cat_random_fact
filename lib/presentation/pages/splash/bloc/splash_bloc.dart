import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cat_random_fact/utils/service_locator.dart';
import 'package:equatable/equatable.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashLoading()) {
    on<SplashInitialLoading>(_loadResourses);
  }

  FutureOr<void> _loadResourses(
      SplashInitialLoading event, Emitter<SplashState> emit) async {
    await serviceLocator.allReady();
    emit(const SplashSuccess());
  }
}
