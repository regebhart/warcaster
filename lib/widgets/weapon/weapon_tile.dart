import 'package:akar_icons_flutter/akar_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ps.dart';
import 'package:warcaster/models/weapons.dart';
import 'package:warcaster/widgets/stats/stat_title.dart';
import 'package:warcaster/widgets/stats/stat_value.dart';

import '../ability/ability_icon.dart';
import '../ability/ability_list.dart';

class WeaponTile extends StatefulWidget {
  final String warcasterStr;
  final Weapon weapon;
  const WeaponTile({Key? key, required this.warcasterStr, required this.weapon}) : super(key: key);

  @override
  State<WeaponTile> createState() => _WeaponTileState();
}

class _WeaponTileState extends State<WeaponTile> {
  @override
  Widget build(BuildContext context) {
    final weapon = widget.weapon;

    List<Widget> damageTypeList = [];

    if (weapon.damagetype!.isNotEmpty) {
      weapon.damagetype!.forEach((ability) {
        damageTypeList.add(Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: AbilityIcon(ability: ability),
        ));
      });
    }

    Widget child = Row(
      children: [
        weapon.type == "m"
            ? const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Icon(AkarIcons.sword, size: 20),
              )
            : const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Iconify(Ps.gun, size: 20),
              ),
        Expanded(
          child: Table(
            border: TableBorder.all(
              width: 1,
              color: Colors.black,
            ),
            children: [
              weapon.type == "m"
                  ? const TableRow(
                      children: [
                        StatTitle(title: "RNG"),
                        StatTitle(title: "POW"),
                        StatTitle(title: "P+S"),
                      ],
                    )
                  : const TableRow(
                      children: [
                        StatTitle(title: "RNG"),
                        StatTitle(title: "ROF"),
                        StatTitle(title: "AOE"),
                        StatTitle(title: "POW"),
                      ],
                    ),
              weapon.type == "m"
                  ? TableRow(
                      children: [
                        StatValue(value: weapon.rng),
                        StatValue(value: weapon.pow),
                        StatValue(value: (int.parse(weapon.pow) + int.parse(widget.warcasterStr)).toString()),
                      ],
                    )
                  : TableRow(
                      children: [
                        StatValue(value: weapon.rng),
                        StatValue(value: weapon.rof ?? "-"),
                        StatValue(value: weapon.aoe ?? "-"),
                        StatValue(value: weapon.pow),
                      ],
                    ),
            ],
          ),
        ),
        if (weapon.damagetype!.isNotEmpty)
          Row(
            children: damageTypeList,
          ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          color: Colors.white30,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 3.0, right: 5.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  weapon.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child,
                if (weapon.abilities!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: AbilityList(weapon: weapon),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
