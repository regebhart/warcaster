import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warcaster/widgets/game_list_tile.dart';
import 'package:warcaster/widgets/warcaster/warcaster_list.dart';

import '../models/faction.dart';
import '../providers/game_provider.dart';

class ModelTypeList extends StatelessWidget {
  // final Faction faction;
  const ModelTypeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context, listen: false);

    void ontap(String title) {
      late int navTo;

      switch (title) {
        case "warcaster":
          navTo = 3;
          break;
        case "warjack":
        // navTo = WarcasterList(faction: faction);
        // break;
        case "warbeast":
        // navTo = WarcasterList(faction: faction);
        // break;
        case "battle engine":
        // navTo = WarcasterList(faction: faction);
        // break;
        case "gargantuan":
        // navTo = WarcasterList(faction: faction);
        // break;
        case "solos":
        // navTo = WarcasterList(faction: faction);
        // break;
        case "units":
        // navTo = WarcasterList(faction: faction);
        // break;
        case "attachments":
        // navTo = WarcasterList(faction: faction);
        // break;
        default:
          navTo = 3;
      }

      gameProvider.pageController.animateToPage(navTo, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      children: [
        GameListTile(
            title: "Warcasters",
            onTap: () {
              ontap("warcaster");
            }),
        GameListTile(
            title: "Warjacks",
            onTap: () {
              ontap("warjack");
            }),
        GameListTile(
            title: "Battle engine / Structures",
            onTap: () {
              ontap("battle engine");
            }),
        GameListTile(
            title: "Solos",
            onTap: () {
              ontap("solos");
            }),
        GameListTile(
            title: "Units",
            onTap: () {
              ontap("units");
            }),
        GameListTile(
            title: "Attachments",
            onTap: () {
              ontap("attachments");
            }),
      ],
    );
  }
}
