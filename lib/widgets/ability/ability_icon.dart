import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:icofont_flutter/icofont_flutter.dart';

class AbilityIcon extends StatelessWidget {
  final String ability;
  const AbilityIcon({Key? key, required this.ability}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData icon;

    switch (ability) {
      case "Undead":
        icon = IcoFontIcons.skullFace;
        break;
      case "Tough":
        icon = Icons.tornado_outlined;
        break;
      case "Magical":
        icon = BootstrapIcons.stars;
        break;
      default:
        icon = Icons.accessible;
    }

    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: MediaQuery.of(context).size.height * 0.015,
      child: CircleAvatar(
        backgroundColor: Colors.black,
        radius: MediaQuery.of(context).size.height * 0.013,
        child: Icon(
          icon,
          color: Colors.white,
          size: MediaQuery.of(context).size.height * 0.02,
        ),
      ),
    );
  }
}
