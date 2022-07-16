import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warcaster/providers/game_provider.dart';
import 'package:warcaster/widgets/game_list_tile.dart';

import '../../models/faction.dart';

class FactionList extends StatefulWidget {
  const FactionList({Key? key}) : super(key: key);

  @override
  State<FactionList> createState() => _FactionListState();
}

class _FactionListState extends State<FactionList> {
  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context, listen: false);

    void ontap(Faction faction) {
      gameProvider.setFaction(faction);
      gameProvider.pageController.animateToPage(2, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }

    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        // physics: const ClampingScrollPhysics(),
        itemCount: gameProvider.game.factions.length,
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        itemBuilder: (context, i) {
          return GameListTile(
            addButton: false,
            title: gameProvider.game.factions[i].name,
            onTap: () {
              ontap(gameProvider.game.factions[i]);
            },
          );
          // return FactionTile(faction: gameProvider.game.factions[i]);
        });
  }
}
