import 'package:flutter/material.dart';
import 'package:warcaster/models/spells.dart';
import 'package:warcaster/widgets/stats/stat_value.dart';

class SpellTile extends StatefulWidget {
  final Spell spell;
  const SpellTile({Key? key, required this.spell}) : super(key: key);

  @override
  State<SpellTile> createState() => _SpellTileState();
}

class _SpellTileState extends State<SpellTile> {
  @override
  Widget build(BuildContext context) {
    final Spell spell = widget.spell;
    String duration;

    switch (spell.dur) {
      case "Upkeep":
      case "up":
        duration = "UP";
        break;
      default:
        duration = spell.dur ?? "-";
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Table(
          // border: TableBorder.all(
          //   width: 1,
          //   color: Colors.black,
          // ),
          columnWidths: const {
            0: FlexColumnWidth(4),
            1: FlexColumnWidth(1),
            2: FlexColumnWidth(1),
            3: FlexColumnWidth(1),
            4: FlexColumnWidth(1),
            5: FlexColumnWidth(1),
            6: FlexColumnWidth(1),
          },
          children: [
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0, top: 2.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      spell.name,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                StatValue(value: spell.cost),
                StatValue(value: spell.rng),
                StatValue(value: spell.aoe ?? "-"),
                StatValue(value: spell.pow ?? "-"),
                StatValue(value: duration),
                StatValue(value: spell.off ? "Yes" : "No"),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Text(
            spell.description,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
