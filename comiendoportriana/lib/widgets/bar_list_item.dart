import 'package:comiendoportriana/models/bar.dart';
import 'package:flutter/material.dart';

class BarListItem extends StatelessWidget {
  const BarListItem({super.key, required this.barContent});

  final BarContent barContent;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: ListTile(
        //leading: Image(image: ),
        title: Text(barContent.name as String),
        isThreeLine: true,
        subtitle: Text(barContent.description as String),
        dense: true,
      ),
    );
  }
}
