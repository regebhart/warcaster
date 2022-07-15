import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warcaster/providers/game_provider.dart';

import '../../models/faction.dart';
import 'faction_tile.dart';

class FactionList extends StatefulWidget {
  const FactionList({Key? key}) : super(key: key);

  @override
  State<FactionList> createState() => _FactionListState();
}

class _FactionListState extends State<FactionList> {
  @override
  Widget build(BuildContext context) {
    final factionProvider = Provider.of<GameProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            // physics: const ClampingScrollPhysics(),
            itemCount: factionProvider.game.factions.length,
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            itemBuilder: (context, i) {
              return FactionTile(faction: factionProvider.game.factions[i]);
            }),
      ),
    );
  }
}
