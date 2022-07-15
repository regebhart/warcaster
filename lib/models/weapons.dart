import 'abilities.dart';

class Weapon {
  String name;
  String type;
  String rng;
  String? rof;
  String? aoe;
  String pow;
  List<String>? damagetype;
  List<Ability>? abilities;

  Weapon({
    required this.name,
    required this.type,
    required this.rng,
    this.rof,
    this.aoe,
    required this.pow,
    this.damagetype,
    this.abilities,
  });

  factory Weapon.fromJson(Map<String, dynamic> json) {
    List<String> damagetypes = [];
    if (json.containsKey('damagetype')) {
      for (var d in json['damagetype']) {
        String damagetype = d;
        damagetypes.add(damagetype);
      }
    }

    List<Ability> abilities = [];
    if (json.containsKey('ability')) {
      for (var a in json['ability']) {
        Ability ability = Ability.fromJson(a);
        abilities.add(ability);
      }
    }

    return Weapon(
      name: json['name'],
      type: json['type'],
      rng: json['rng'],
      rof: json['rof'],
      aoe: json['aoe'],
      pow: json['pow'],
      damagetype: damagetypes,
      abilities: abilities,
    );
  }
}
