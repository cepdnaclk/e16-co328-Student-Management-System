import 'package:flutter/material.dart';
import 'package:mobile_app_for_students/services/data_fetch.dart';
import 'package:mobile_app_for_students/shared/loading_page.dart';
import 'package:mobile_app_for_students/subpages/attendence_page.dart';
import 'package:mobile_app_for_students/subpages/graph.dart';
import 'package:mobile_app_for_students/subpages/marks_page.dart';
import 'package:mobile_app_for_students/subpages/payments_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading = true;

  // loading data at init state
  void loadData() async {
    await DataFetch.fetchMarks();
    await DataFetch.fetchPayments();
    await DataFetch.fetchAttendence();
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[800],
          title: const Text('Student Management System'),
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text('Marks'),
                icon: Icon(Icons.mail),
              ),
              Tab(
                child: Text('Payments'),
                icon: Icon(Icons.payments_sharp),
              ),
              Tab(
                child: Text('Attendence'),
                icon: Icon(Icons.check),
              ),
            ],
          ),
        ),
        body: loading
            ? Loading()
            : const TabBarView(
                children: [
                  MarksPage(),
                  PaymentsPage(),
                  AttendencePage(),
                ],
              ),
      ),
    );
  }
}
