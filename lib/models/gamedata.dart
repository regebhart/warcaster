import 'game.dart';

class GameData {
  List<Game> gameList;

  GameData({
    required this.gameList,
  });

  factory GameData.fromJson(Map<String, dynamic> json) {
    List<Game> games = [];

    for (var g in json['game']) {
      Game game = Game.fromJson(g);
      games.add(game);
    }

    return GameData(
      gameList: games,
    );
  }
}
