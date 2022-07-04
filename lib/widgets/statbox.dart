// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class StatBox extends StatelessWidget {
//   final String statText;
//   final int statVal;
//   const StatBox({Key? key, required this.statText, required this.statVal}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TableCell
//       Padding(
//         padding: const EdgeInsets.all(2.0),
//         child: Text(statText, textAlign: TextAlign.center),
//       ),
//       // const Divider(thickness: 5,),
//       SizedBox(
//         width: MediaQuery.of(context).size.width * 0.08,
//         height: 5,
//         child: Center(
//           child: Container(
//             // margin: const EdgeInsetsDirectional.only(start: 0, end: 1.0),
//             height: 1.0,
//             color: Colors.black,
//           ),
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.all(2.0),
//         child: Text(statVal.toString(), textAlign: TextAlign.center),
//       ),
//     ]);
//   }
// }
