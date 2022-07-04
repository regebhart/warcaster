import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ModelName extends StatefulWidget {
  final String id;
  const ModelName({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<ModelName> createState() => _ModelNameState();
}

class _ModelNameState extends State<ModelName> {
  @override
  Widget build(BuildContext context) {
    CollectionReference model = FirebaseFirestore.instance.collection('models');

    return FutureBuilder(
      future: model.doc(widget.id).get(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snap) {
        if (snap.hasData) {
          Map<String, dynamic> data = snap.data!.data() as Map<String, dynamic>;
          return Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  data['name'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  data['title'],
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
