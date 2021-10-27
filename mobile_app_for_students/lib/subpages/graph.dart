import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_for_students/services/data_fetch.dart';

final List<Feature> features = [
  Feature(
    title: "Grocery Shopping",
    color: Colors.amber,
    data: DataFetch.marksValue,
  ),
];

class MarksGraph extends StatelessWidget {
  const MarksGraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[900],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LineGraph(
              features: features,
              size: const Size(350, 200),
              labelX: DataFetch.paperTitles,
              labelY: const ['20%', '40%', '60%', '80%', '100%'],
              showDescription: false,
              graphColor: Colors.white,
              graphOpacity: 0.2,
              verticalFeatureDirection: true,
              descriptionHeight: 130,
            ),
          ],
        ),
      ),
    );
  }
}
