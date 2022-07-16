import 'package:flutter/material.dart';

class StatTitle extends StatelessWidget {
  final String title;
  const StatTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          title,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.015,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
