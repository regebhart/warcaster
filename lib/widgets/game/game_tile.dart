import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warcaster/providers/game_provider.dart';
import 'package:warcaster/widgets/faction/faction_list.dart';

import '../../models/game.dart';

class GameTile extends StatelessWidget {
  final Game game;
  const GameTile({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ListTile(
          onTap: () {
            Provider.of<GameProvider>(context, listen: false).setGame(game);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const FactionList(),
              ),
            );
          },
          tileColor: Colors.green,
          dense: true,
          trailing: const Icon(Icons.expand_more_outlined),
          title: Text(
            game.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
