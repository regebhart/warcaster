import 'package:flutter/material.dart';

import '../../models/warcaster.dart';
import 'character_ability_tile.dart';

class CharacterAbilityList extends StatelessWidget {
  final Warcaster warcaster;
  const CharacterAbilityList({Key? key, required this.warcaster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: warcaster.characterabilities!.length,
          itemBuilder: (context, index) {
            return CharacterAbilityTile(ability: warcaster.characterabilities![index]);
          },
        ),
      ],
    );
  }
}
