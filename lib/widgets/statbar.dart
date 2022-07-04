import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:warcaster/widgets/stat_title.dart';
import 'package:warcaster/widgets/stat_value.dart';

class StatBar extends StatefulWidget {
  final String id;
  const StatBar({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<StatBar> createState() => _StatBarState();
}

class _StatBarState extends State<StatBar> {
  @override
  Widget build(BuildContext context) {
    CollectionReference modelinfo = FirebaseFirestore.instance.collection('models').doc(widget.id).collection('stats');

    return FutureBuilder(
        future: modelinfo.doc('basestats').get(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snap) {
          if (snap.hasData) {
            Map<String, dynamic> data = snap.data!.data() as Map<String, dynamic>;
            return Row(
              children: [
                Expanded(
                  child: Table(
                    border: TableBorder.all(
                      width: 1,
                      color: Colors.black,
                    ),
                    children: [
                      const TableRow(
                        children: [
                          StatTitle(title: "SPD"),
                          StatTitle(title: "STR"),
                          StatTitle(title: "MAT"),
                          StatTitle(title: "RAT"),
                          StatTitle(title: "DEF"),
                          StatTitle(title: "ARM"),
                          StatTitle(title: "CMD"),
                        ],
                      ),
                      TableRow(
                        children: [
                          StatValue(value: data['SPD']),
                          StatValue(value: data['STR']),
                          StatValue(value: data['MAT']),
                          StatValue(value: data['RAT']),
                          StatValue(value: data['DEF']),
                          StatValue(value: data['ARM']),
                          StatValue(value: data['CMD']),
                        ],
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ),
                StatValue(value: data['health']),
              ],
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
