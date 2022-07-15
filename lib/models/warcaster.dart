import 'package:warcaster/models/abilities.dart';
import 'package:warcaster/models/base_stats.dart';
import 'package:warcaster/models/weapons.dart';

import 'feats.dart';
import 'spells.dart';

class Warcaster {
  String name;
  String title;
  List<String>? abilities;
  List<Ability>? characterabilities;
  BaseStats stats;
  String focus;
  List<Weapon> weapons;
  Feat? feat;
  List<Spell> spells;

  Warcaster({
    required this.name,
    required this.title,
    this.abilities,
    this.characterabilities,
    required this.stats,
    required this.focus,
    required this.weapons,
    this.feat,
    required this.spells,
  });

  factory Warcaster.fromJson(Map<String, dynamic> json) {
    List<String> abilities = [];
    if (json.containsKey('abilities')) {
      for (var a in json['abilities']) {
        print(a);
        String ability = a;
        abilities.add(ability);
      }
    }

    List<Weapon> weapons = [];
    if (json.containsKey('weapons')) {
      for (var w in json['weapons']) {
        // print(w);
        Weapon weapon = Weapon.fromJson(w);
        weapons.add(weapon);
      }
    }

    List<Spell> spells = [];
    if (json.containsKey('spells')) {
      for (var s in json['spells']) {
        // print(s);
        Spell spell = Spell.fromJson(s);
        spells.add(spell);
      }
    }

    List<Ability> characterabilities = [];
    if (json.containsKey('characterabilities')) {
      for (var ca in json['characterabilities']) {
        // print(ca);
        Ability characterability = Ability.fromJson(ca);
        characterabilities.add(characterability);
      }
    }
    // print(json['name']);
    // print(json['title']);
    // print(BaseStats.fromJson(json['stats']));
    // print(json['focus']);
    // print(Feat.fromJson(json['feat']));
    // print(weapons);
    // print(spells);
    return Warcaster(
      name: json['name'],
      title: json['title'],
      abilities: abilities,
      characterabilities: characterabilities,
      stats: BaseStats.fromJson(json['stats']),
      focus: json['focus'],
      weapons: weapons,
      feat: Feat.fromJson(json['feat']),
      spells: spells,
    );
  }
}
