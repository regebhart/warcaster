import 'package:flutter/material.dart';

class StatValue extends StatelessWidget {
  final int value;
  const StatValue({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Text(value.toString(), textAlign: TextAlign.center),
    );
  }
}
