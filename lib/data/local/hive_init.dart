import 'package:cat_random_fact/data/local/hive_local_storage.dart';
import 'package:cat_random_fact/data/models/cat_fact.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@module
abstract class HiveModule {
  static const _catFactBoxName = "cat_fact_box";

  @singleton
  Future<HiveBoxLocalStorage<CatFactModel>> get hiveInstance async {
    final box = await Hive.openBox<CatFactModel>(HiveModule._catFactBoxName);
    return HiveBoxLocalStorage(box);
  }
}
