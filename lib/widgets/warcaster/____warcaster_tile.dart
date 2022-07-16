import 'package:flutter/material.dart';
import 'package:warcaster/widgets/warcaster/warcaster_card.dart';

import '../../models/warcaster.dart';

class WarcasterTile extends StatelessWidget {
  final Warcaster warcaster;
  const WarcasterTile({
    Key? key,
    required this.warcaster,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ListTile(
          // onTap: () {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (BuildContext context) => WarcasterCard(
          //         warcaster: warcaster,
          //       ),
          //     ),
          //   );
          // },
          tileColor: Colors.green,
          dense: true,
          trailing: const Icon(Icons.expand_more_outlined),
          title: Text(
            warcaster.name,
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
