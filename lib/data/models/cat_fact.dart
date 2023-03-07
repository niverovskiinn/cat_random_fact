import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cat_fact.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class CatFactModel with EquatableMixin {
  @JsonKey(name: '_id')
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String text;
  @HiveField(2)
  final DateTime createdAt;

  CatFactModel(this.id, this.text, this.createdAt);

  factory CatFactModel.fromJson(Map<String, Object?> json) =>
      _$CatFactModelFromJson(json);

  @override
  List<Object?> get props => [id, text, createdAt];

  @override
  bool? get stringify => true;
}
