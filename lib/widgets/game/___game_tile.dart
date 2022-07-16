// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../models/game.dart';
// import '../../providers/game_provider.dart';

// class GameTile extends StatelessWidget {
//   final Game game;
//   const GameTile({
//     Key? key,
//     required this.game,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final gameProvider = Provider.of<GameProvider>(context, listen: false);

//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 2.0),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(10),
//         child: ListTile(
//           onTap: () {
//             gameProvider.setGame(game);
//             gameProvider.pageController.animateToPage(1, duration: const Duration(milliseconds: 600), curve: Curves.easeIn);
//           },
//           tileColor: Colors.green,
//           dense: true,
//           trailing: const Icon(Icons.expand_more_outlined),
//           title: Text(
//             game.name,
//             style: const TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
