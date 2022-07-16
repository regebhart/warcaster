import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warcaster/models/gamedata.dart';
import 'package:warcaster/widgets/faction/faction_list.dart';
import 'package:warcaster/widgets/game/game_list.dart';
import 'package:warcaster/widgets/model_type_selection.dart';
import 'package:warcaster/widgets/warcaster/warcaster_card.dart';
import 'package:warcaster/widgets/warcaster/warcaster_list.dart';

import '../../providers/game_provider.dart';

class GamePageView extends StatefulWidget {
  const GamePageView({Key? key}) : super(key: key);

  @override
  State<GamePageView> createState() => _GamePageViewState();
}

class _GamePageViewState extends State<GamePageView> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context, listen: true);
    gameProvider.setPageController(pageController);

    Future<bool> _onBackPressed() {
      gameProvider.pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      return Future.value(false);
      // }
    }

    return FutureBuilder(
        future: gameProvider.readFullGameData(),
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (snap.hasData == false) {
            return const Text("No data");
          } else {
            return WillPopScope(
              onWillPop: _onBackPressed,
              child: PageView(
                controller: pageController,
                children: const [
                  GameList(),
                  FactionList(),
                  ModelTypeList(),
                  WarcasterList(),
                  WarcasterCard(),
                ],
              ),
            );
          }
        });
  }
}
