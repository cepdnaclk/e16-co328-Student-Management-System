import 'package:flutter/material.dart';
import 'package:mobile_app_for_students/services/data_fetch.dart';

class AttendencePage extends StatefulWidget {
  const AttendencePage({Key? key}) : super(key: key);

  @override
  _AttendencePageState createState() => _AttendencePageState();
}

class _AttendencePageState extends State<AttendencePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: DataFetch.classDates.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Row(
                          children: [
                            const Text(
                              "Date:",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(DataFetch.classDates[index]['date']),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Row(
                          children: [
                            const Text(
                              "From:",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                                "${DataFetch.classDates[index]['from']} - ${DataFetch.classDates[index]['to']}"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Row(
                          children: [
                            const Text(
                              "Type:",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(DataFetch.classDates[index]['type']),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  Icon(
                    DataFetch.classDates[index]['presence']
                        ? Icons.check_circle
                        : Icons.cancel_rounded,
                    color: DataFetch.classDates[index]['presence']
                        ? Colors.green
                        : Colors.red,
                    size: 50,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
