import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
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
        body: TabBarView(
          children: [
            const Text('Marks'),
            const Text('Payments'),
            const Text('Attendence'),
          ],
        ),
      ),
    );
  }
}
