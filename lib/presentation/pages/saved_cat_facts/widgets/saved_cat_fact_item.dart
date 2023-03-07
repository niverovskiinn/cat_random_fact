import 'package:flutter/material.dart';
import 'package:cat_random_fact/domain/entities/cat_fact.dart';
import 'package:intl/intl.dart';

class SavedCatFactItem extends StatelessWidget {
  static final _dateFormat = DateFormat.yMd();
  final CatFact item;
  const SavedCatFactItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(_dateFormat.format(item.createdAt)),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      expandedAlignment: Alignment.centerLeft,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            item.text,
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
