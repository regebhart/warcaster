import 'package:flutter/material.dart';
import '../../models/warcaster.dart';
import 'spell_tile.dart';
import '../stats/stat_title.dart';

class SpellList extends StatelessWidget {
  final Warcaster warcaster;
  const SpellList({Key? key, required this.warcaster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 2.0),
          child: Table(
            border: TableBorder.all(
              width: 1,
              color: Colors.black,
            ),
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
                  Container(
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        "Spells",
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.015,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const StatTitle(title: "COST"),
                  const StatTitle(title: "RNG"),
                  const StatTitle(title: "AOE"),
                  const StatTitle(title: "POW"),
                  const StatTitle(title: "DUR"),
                  const StatTitle(title: "OFF"),
                ],
              ),
            ],
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            color: Colors.grey[700],
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: warcaster.spells.length,
              itemBuilder: (context, index) {
                return SpellTile(spell: warcaster.spells[index]);
              },
            ),
          ),
        ),
      ],
    );
  }
}
