import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warcaster/providers/game_provider.dart';
import 'package:warcaster/widgets/model_type_selection.dart';
import '../../models/faction.dart';

class FactionTile extends StatelessWidget {
  final Faction faction;
  const FactionTile({
    Key? key,
    required this.faction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ListTile(
          onTap: () {
            Provider.of<GameProvider>(context, listen: false).setFaction(faction);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => ModelTypeList(faction: faction),
              ),
            );
          },
          tileColor: Colors.green,
          dense: true,
          trailing: const Icon(Icons.expand_more_outlined),
          title: Text(
            faction.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
