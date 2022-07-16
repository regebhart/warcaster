import 'package:flutter/material.dart';

class GameListTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool addButton;
  Widget? addButtonWidget;

  GameListTile({Key? key, required this.title, required this.onTap, required this.addButton, this.addButtonWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: ListTile(
        dense: true,
        tileColor: Colors.black,
        leading: addButton ? addButtonWidget : null,
        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onTap: onTap,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
