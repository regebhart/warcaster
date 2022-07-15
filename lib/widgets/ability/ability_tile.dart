import 'package:flutter/material.dart';
import 'package:warcaster/models/abilities.dart';

class AbilityTile extends StatelessWidget {
  final Ability ability;
  const AbilityTile({Key? key, required this.ability}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ability.name,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        Text(
          ability.description,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
