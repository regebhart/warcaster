import 'package:flutter/material.dart';

class StatValue extends StatelessWidget {
  final String value;
  const StatValue({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Text(
        value,
        textAlign: TextAlign.center,
        maxLines: 1,
        style: TextStyle(
          color: Colors.white,
          fontSize: MediaQuery.of(context).size.height * 0.0165,
        ),
      ),
    );
  }
}
