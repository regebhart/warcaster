import 'package:flutter/material.dart';

class StatTitle extends StatelessWidget {
  final String title;
  const StatTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Text(title, textAlign: TextAlign.center),
    );
  }
}
