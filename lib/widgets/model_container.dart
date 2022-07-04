import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:warcaster/widgets/model_name.dart';
import 'package:warcaster/widgets/statbar.dart';

class ModelContainer extends StatefulWidget {
  const ModelContainer({Key? key}) : super(key: key);

  @override
  State<ModelContainer> createState() => _ModelContainerState();
}

class _ModelContainerState extends State<ModelContainer> {
  CollectionReference model = FirebaseFirestore.instance.collection('models');

  @override
  Widget build(BuildContext context) {
    const String modelID = 'asphyxious1';

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: const <Widget>[
          ModelName(id: modelID),
          StatBar(id: modelID),
        ],
      ),
    );
  }
}
