import 'package:flutter/material.dart';

class ChartMainPage extends StatefulWidget {
  const ChartMainPage({super.key});

  @override
  _ChartMainPageState createState() => _ChartMainPageState();
}

class _ChartMainPageState extends State<ChartMainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data and Statistics"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              trailing: const Icon(Icons.navigate_next),
              title: const Text("Bar Charts"),
              onTap: () {
                Navigator.pushNamed(context, "/bar_chart_page");
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              trailing: const Icon(Icons.navigate_next),
              title: const Text("Line Charts"),
              onTap: () {
                Navigator.pushNamed(context, "/line_chart_page");
              },
            ),
          ],
        ),
      ),
    );
  }
}
