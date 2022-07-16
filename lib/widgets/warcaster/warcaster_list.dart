import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warcaster/providers/game_provider.dart';
import 'package:warcaster/providers/user_list_provider.dart';
import 'package:warcaster/widgets/game_list_tile.dart';
import 'package:warcaster/widgets/warcaster/____warcaster_tile.dart';

import '../../models/warcaster.dart';

class WarcasterList extends StatefulWidget {
  const WarcasterList({
    Key? key,
    // required this.faction,
  }) : super(key: key);

  @override
  State<WarcasterList> createState() => _WarcasterListState();
}

class _WarcasterListState extends State<WarcasterList> {
  bool firstbuild = false;
  List<bool> isAdded = [];

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context, listen: false);
    final userListProvider = Provider.of<UserListProvider>(context, listen: false);

    if (!firstbuild) {
      firstbuild = true;
      for (var w in gameProvider.faction.warcasters!) {
        if (userListProvider.userList.userList!.warcasters!.contains(w)) {
          isAdded.add(true);
        } else {
          isAdded.add(false);
        }
      }
    }

    void ontap(Warcaster warcaster) {
      gameProvider.setWarcaster(warcaster);
      gameProvider.pageController.animateToPage(4, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }

    //1. check for active list (name set)
    //2. "Start a new list?"
    //3. "Enter name and description then save"
    //4. add warcaster to the list
    //5. change add button to remove button

    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      // physics: const ClampingScrollPhysics(),
      itemCount: gameProvider.faction.warcasters!.length,
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      itemBuilder: (context, i) {
        final String snackMessage = "${gameProvider.faction.warcasters![i].name} ${isAdded[i] ? "removed." : "added."}";
        final snackBar = SnackBar(content: Text(snackMessage));
        return GameListTile(
          addButton: true,
          addButtonWidget: GestureDetector(
            onTap: () {
              isAdded[i]
                  ? userListProvider.removeWarcaster(gameProvider.faction.warcasters![i])
                  : userListProvider.addWarcaster(gameProvider.faction.warcasters![i]);
              setState(() {
                isAdded[i] = !isAdded[i];
              });
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: Icon(
              isAdded[i] ? Icons.remove_circle_outline : Icons.add_circle_outline,
              color: Colors.white,
            ),
          ),
          title: gameProvider.faction.warcasters![i].name,
          onTap: () {
            ontap(gameProvider.faction.warcasters![i]);
          },
        );
      },
    );
  }
}
