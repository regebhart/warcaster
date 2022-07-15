import 'faction.dart';

class Game {
  String name;
  List<Faction> factions;

  Game({
    required this.name,
    required this.factions,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    List<Faction> factions = [];

    for (var f in json['faction']) {
      Faction faction = Faction.fromJson(f);
      factions.add(faction);
    }

    return Game(
      name: json['name'],
      factions: factions,
    );
  }
}
