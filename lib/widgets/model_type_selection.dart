import 'package:flutter/material.dart';
import 'package:warcaster/widgets/warcaster/warcaster_list.dart';

import '../models/faction.dart';

class ModelTypeList extends StatelessWidget {
  final Faction faction;
  const ModelTypeList({Key? key, required this.faction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void ontap(String title) {
      late Widget navTo;

      switch (title) {
        case "warcaster":
          navTo = WarcasterList(faction: faction);
          break;
        case "warjack":
          // navTo = WarcasterList(faction: faction);
          break;
        case "warbeast":
          // navTo = WarcasterList(faction: faction);
          break;
        case "battle engine":
          // navTo = WarcasterList(faction: faction);
          break;
        case "gargantuan":
          // navTo = WarcasterList(faction: faction);
          break;
        case "solos":
          // navTo = WarcasterList(faction: faction);
          break;
        case "units":
          // navTo = WarcasterList(faction: faction);
          break;
        case "attachments":
          // navTo = WarcasterList(faction: faction);
          break;
        default:
          navTo = const SizedBox();
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => navTo,
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            ListTile(onTap: () => ontap('warcaster'), title: const Text("Warcasters")),
            ListTile(onTap: () => ontap('warjack'), title: const Text("Warjacks")),
            ListTile(onTap: () => ontap('battle engine'), title: const Text("Battle Engines / Structures")),
            ListTile(onTap: () => ontap('solos'), title: const Text("Solos")),
            ListTile(onTap: () => ontap('units'), title: const Text("Units")),
            ListTile(onTap: () => ontap('attachments'), title: const Text("Attachments")),
          ],
        ),
      ),
    );
  }
}
