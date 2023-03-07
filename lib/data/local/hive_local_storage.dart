import 'package:hive/hive.dart';

class HiveBoxLocalStorage<T> {
  final Box<T> _hiveBox;

  HiveBoxLocalStorage(this._hiveBox);

  Future<void> add(String id, T item) async => _hiveBox.put(id, item);

  Future<void> delete(String id) async => _hiveBox.delete(id);

  Iterable<T> getAll() => _hiveBox.values;

  T? getById({String? id}) => _hiveBox.get(id);
}
