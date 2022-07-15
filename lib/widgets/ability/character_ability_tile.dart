import 'package:flutter/material.dart';
import '../../models/abilities.dart';

class CharacterAbilityTile extends StatelessWidget {
  final Ability ability;
  const CharacterAbilityTile({Key? key, required this.ability}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          color: Colors.white30,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: ability.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: " - ${ability.description}"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
