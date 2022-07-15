import 'package:flutter/material.dart';
import 'package:warcaster/models/weapons.dart';

import 'ability_tile.dart';

class AbilityList extends StatelessWidget {
  final Weapon weapon;
  const AbilityList({Key? key, required this.weapon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: weapon.abilities!.length,
          itemBuilder: (context, index) {
            return AbilityTile(ability: weapon.abilities![index]);
          },
        ),
      ],
    );
  }
}
