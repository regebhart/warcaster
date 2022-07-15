class BaseStats {
  String spd;
  String str;
  String mat;
  String rat;
  String def;
  String arm;
  String cmd;
  String hp;

  BaseStats({
    required this.spd,
    required this.str,
    required this.mat,
    required this.rat,
    required this.def,
    required this.arm,
    required this.cmd,
    required this.hp,
  });

  factory BaseStats.fromJson(Map<String, dynamic> json) {
    return BaseStats(
      spd: json['spd'],
      str: json['str'],
      mat: json['mat'],
      rat: json['rat'],
      def: json['def'],
      arm: json['arm'],
      cmd: json['cmd'],
      hp: json['hp'],
    );
  }
}
