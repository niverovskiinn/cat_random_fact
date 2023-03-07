import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:cat_random_fact/utils/service_locator.config.dart';

final serviceLocator = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: false,
  asExtension: true,
)
Future<void> configureDependencies() async => serviceLocator.init();
