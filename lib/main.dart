import 'dart:io';

import 'package:cat_random_fact/data/models/cat_fact.dart';
import 'package:cat_random_fact/navigation/app_router.dart';
import 'package:cat_random_fact/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(CatFactModelAdapter());
  Intl.defaultLocale = Platform.localeName;
  await Future.wait([
    initializeDateFormatting(),
    configureDependencies(),
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routerConfig: serviceLocator.get<AppRouter>().router,
    );
  }
}
