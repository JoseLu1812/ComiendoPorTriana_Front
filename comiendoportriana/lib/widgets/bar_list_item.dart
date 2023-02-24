import 'package:comiendoportriana/models/bar.dart';
import 'package:flutter/material.dart';

class BarListItem extends StatelessWidget {
  const BarListItem({super.key, required this.bar});

  final BarContent bar;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Material(
      child: ListTile(
        //leading: Image(image: ),
        title: Text(bar.name!),
        isThreeLine: true,
        subtitle: Text(bar.description!),
        dense: true,
      ),
    );
  }
}
