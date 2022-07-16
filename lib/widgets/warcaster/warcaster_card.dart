import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warcaster/models/warcaster.dart';
import 'package:warcaster/providers/game_provider.dart';
import 'package:warcaster/widgets/warcaster/feat_tile.dart';
import 'package:warcaster/widgets/spell/spell_list.dart';

import '../ability/ability_icon.dart';
import '../ability/character_ability_list.dart';
import '../stats/stat_bar.dart';
import '../weapon/weapon_list.dart';

class WarcasterCard extends StatefulWidget {
  // final Warcaster warcaster;
  const WarcasterCard({
    Key? key,
    // required this.warcaster,
  }) : super(key: key);

  @override
  State<WarcasterCard> createState() => _WarcasterCardState();
}

class _WarcasterCardState extends State<WarcasterCard> {
  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context, listen: false);
    final Warcaster warcaster = gameProvider.warcaster;

    List<Widget> abilityList = [];

    if (warcaster.abilities!.isNotEmpty) {
      warcaster.abilities!.forEach((ability) {
        abilityList.add(AbilityIcon(ability: ability));
      });
    }

    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            warcaster.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            warcaster.title,
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      if (warcaster.abilities!.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(right: 60.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: abilityList,
                          ),
                        ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: StatBar(focus: warcaster.focus, stats: warcaster.stats),
                  ),
                  CharacterAbilityList(warcaster: warcaster),
                  FeatTile(warcaster: warcaster),
                  WeaponList(warcaster: warcaster),
                  SpellList(warcaster: warcaster),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
