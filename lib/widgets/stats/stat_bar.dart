import 'package:flutter/material.dart';
import 'package:warcaster/models/base_stats.dart';
import 'package:warcaster/widgets/stats/stat_title.dart';
import 'package:warcaster/widgets/stats/stat_value.dart';

class StatBar extends StatefulWidget {
  final String focus;
  final BaseStats stats;
  const StatBar({
    Key? key,
    required this.focus,
    required this.stats,
  }) : super(key: key);

  @override
  State<StatBar> createState() => _StatBarState();
}

class _StatBarState extends State<StatBar> {
  @override
  Widget build(BuildContext context) {
    final BaseStats stats = widget.stats;
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Table(
              border: TableBorder.all(
                width: 1,
                color: Colors.white,
              ),
              children: [
                const TableRow(
                  children: [
                    StatTitle(title: "FCS"),
                    StatTitle(title: "SPD"),
                    StatTitle(title: "STR"),
                    StatTitle(title: "MAT"),
                    StatTitle(title: "RAT"),
                    StatTitle(title: "DEF"),
                    StatTitle(title: "ARM"),
                    StatTitle(title: "CMD"),
                  ],
                ),
                TableRow(
                  children: [
                    StatValue(value: widget.focus),
                    StatValue(value: stats.spd),
                    StatValue(value: stats.str),
                    StatValue(value: stats.mat),
                    StatValue(value: stats.rat),
                    StatValue(value: stats.def),
                    StatValue(value: stats.arm),
                    StatValue(value: stats.cmd),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Icon(
              Icons.favorite,
              color: Colors.redAccent,
            ),
          ),
          StatValue(value: stats.hp),
        ],
      ),
    );
  }
}
