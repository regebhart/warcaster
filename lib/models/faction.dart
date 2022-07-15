import 'warcaster.dart';

class Faction {
  String name;
  List<Warcaster> warcasters;
  // List? warjacks;
  // List? battleengines;
  // List? structures;
  // List? solos;
  // List? units;
  // List? attachments;

  Faction({
    required this.name,
    required this.warcasters,
    // this.warjacks,
    // this.battleengines,
    // this.structures,
    // this.solos,
    // this.units,
    // this.attachments,
  });

  factory Faction.fromJson(Map<String, dynamic> json) {
    List<Warcaster> warcasters = [];

    for (var w in json['warcaster']) {
      // print(w);
      Warcaster warcaster = Warcaster.fromJson(w);
      warcasters.add(warcaster);
    }

    return Faction(
      name: json['name'],
      warcasters: warcasters,
    );
  }
}
