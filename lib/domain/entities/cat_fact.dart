import 'package:cat_random_fact/data/models/cat_fact.dart';
import 'package:cat_random_fact/utils/configs.dart';
import 'package:equatable/equatable.dart';

class CatFact with EquatableMixin {
  final String id;
  final String text;
  final DateTime createdAt;
  final String imageUrl;
  const CatFact({
    required this.id,
    required this.text,
    required this.createdAt,
    required this.imageUrl,
  });

  factory CatFact.fromModel(CatFactModel model, {String? imageUrl}) => CatFact(
        id: model.id,
        text: model.text,
        createdAt: model.createdAt,
        imageUrl: imageUrl ?? "${AppConfigs.randomCatImgUrl}?${model.id}",
      );

  CatFactModel toModel() => CatFactModel(id, text, createdAt);

  @override
  List<Object?> get props => [id, text, createdAt, imageUrl];
}
