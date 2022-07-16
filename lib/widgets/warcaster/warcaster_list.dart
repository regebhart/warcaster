import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warcaster/providers/game_provider.dart';
import 'package:warcaster/widgets/game_list_tile.dart';
import 'package:warcaster/widgets/warcaster/____warcaster_tile.dart';

import '../../models/warcaster.dart';

class WarcasterList extends StatelessWidget {
  // final Faction faction;
  const WarcasterList({
    Key? key,
    // required this.faction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context, listen: false);

    void ontap(Warcaster warcaster) {
      gameProvider.setWarcaster(warcaster);
      gameProvider.pageController.animateToPage(4, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }

    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      // physics: const ClampingScrollPhysics(),
      itemCount: gameProvider.faction.warcasters.length,
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      itemBuilder: (context, i) {
        return GameListTile(
          title: gameProvider.faction.warcasters[i].name,
          onTap: () {
            ontap(gameProvider.faction.warcasters[i]);
          },
        );
      },
    );
  }
}
