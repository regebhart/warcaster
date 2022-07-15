import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warcaster/models/gamedata.dart';

import '../../providers/game_provider.dart';
import 'game_tile.dart';

class GameList extends StatefulWidget {
  const GameList({Key? key}) : super(key: key);

  @override
  State<GameList> createState() => _GameListState();
}

class _GameListState extends State<GameList> {
  @override
  Widget build(BuildContext context) {
    GameData gamedata;
    final factionProvider = Provider.of<GameProvider>(context, listen: true);

    return FutureBuilder(
        future: factionProvider.readFullGameData(),
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (snap.hasData == false) {
            return const Text("No data");
          } else {
            gamedata = snap.data;
            return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                // physics: const ClampingScrollPhysics(),
                itemCount: gamedata.gameList.length,
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                itemBuilder: (context, i) {
                  return GameTile(game: gamedata.gameList[i]);
                });
          }
        });
  }
}
