import 'package:flutter/material.dart';

import '../../models/warcaster.dart';

class FeatTile extends StatelessWidget {
  final Warcaster warcaster;
  const FeatTile({Key? key, required this.warcaster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (warcaster.feat != null) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            color: Colors.grey[700],
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 2.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Feat: ${warcaster.feat!.name}",
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    warcaster.feat!.description,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
