import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:warcaster/widgets/warcaster/warcaster_tile.dart';

import '../../models/faction.dart';

class WarcasterList extends StatelessWidget {
  final Faction faction;
  const WarcasterList({Key? key, required this.faction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      // physics: const ClampingScrollPhysics(),
      itemCount: faction.warcasters.length,
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      itemBuilder: (context, i) {
        return WarcasterTile(warcaster: faction.warcasters[i]);
      },
    );
  }
}
