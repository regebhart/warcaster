class Spell {
  String name;
  String cost;
  String rng;
  String? aoe;
  String? pow;
  String? dur;
  bool off;
  String description;

  Spell({
    required this.name,
    required this.cost,
    required this.rng,
    this.aoe,
    this.pow,
    this.dur,
    required this.off,
    required this.description,
  });

  factory Spell.fromJson(Map<String, dynamic> json) {
    // print(json['name']);
    return Spell(
      name: json['name'],
      cost: json['cost'],
      rng: json['rng'],
      aoe: json['aoe'],
      pow: json['pow'],
      dur: json['dur'],
      off: json['off'],
      description: json['description'],
    );
  }
}
