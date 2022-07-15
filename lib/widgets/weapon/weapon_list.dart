import 'package:flutter/material.dart';
import 'package:warcaster/widgets/weapon/weapon_tile.dart';

import '../../models/warcaster.dart';

class WeaponList extends StatelessWidget {
  final Warcaster warcaster;
  const WeaponList({Key? key, required this.warcaster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: warcaster.weapons.length,
          itemBuilder: (context, index) {
            return WeaponTile(warcasterStr: warcaster.stats.str, weapon: warcaster.weapons[index]);
          },
        ),
      ],
    );
  }
}
