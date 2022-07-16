import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warcaster/widgets/game_list_tile.dart';

import '../../models/game.dart';
import '../../providers/game_provider.dart';

class GameList extends StatelessWidget {
  const GameList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context, listen: true);

    void ontap(Game game) {
      gameProvider.setGame(game);
      gameProvider.pageController.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }

    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        // physics: const ClampingScrollPhysics(),
        itemCount: gameProvider.fullGameData.gameList.length,
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        itemBuilder: (context, i) {
          return GameListTile(
            addButton: false,
            title: gameProvider.fullGameData.gameList[i].name,
            onTap: () {
              ontap(gameProvider.fullGameData.gameList[i]);
            },
          );
          // return GameTile(game: gameProvider.fullGameData.gameList[i]);
        });
  }
}
