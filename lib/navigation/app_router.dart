import 'package:cat_random_fact/presentation/pages/home/bloc/home_bloc.dart';
import 'package:cat_random_fact/presentation/pages/saved_cat_facts/bloc/saved_cat_facts_bloc.dart';
import 'package:cat_random_fact/presentation/pages/saved_cat_facts/saved_cat_facts_page.dart';
import 'package:cat_random_fact/presentation/pages/splash/bloc/splash_bloc.dart';
import 'package:cat_random_fact/presentation/pages/splash/splash_page.dart';
import 'package:cat_random_fact/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cat_random_fact/navigation/page_route_names.dart';
import 'package:cat_random_fact/presentation/pages/home/home_page.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppRouter {
  final _router = GoRouter(
    routes: [
      GoRoute(
        path: PageRoutePathes.splashPage,
        builder: (context, state) => BlocProvider(
          create: (context) => SplashBloc(),
          child: const SplashPage(),
        ),
      ),
      GoRoute(
        path: PageRoutePathes.homePage,
        builder: (context, state) => BlocProvider(
          create: (context) => HomeBloc(serviceLocator.get()),
          child: const HomePage(),
        ),
      ),
      GoRoute(
        path: PageRoutePathes.savedFactsPage,
        builder: (context, state) => BlocProvider(
          create: (context) => SavedCatFactsBloc(serviceLocator.get()),
          child: const SavedCatFactsPage(),
        ),
      ),
    ],
  );

  GoRouter get router => _router;
}
