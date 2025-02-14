import 'package:flutter/material.dart';

class AlarmMainPage extends StatefulWidget {
  const AlarmMainPage({super.key});

  @override
  _AlarmMainPageState createState() => _AlarmMainPageState();
}

class _AlarmMainPageState extends State<AlarmMainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alarm, Clock, Weather"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              trailing: const Icon(Icons.navigate_next),
              title: const Text("Alarm List Page"),
              onTap: () {
                Navigator.pushNamed(context, "/alarm_list_page");
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              trailing: const Icon(Icons.navigate_next),
              title: const Text("Add Alarm Page"),
              onTap: () {
                Navigator.pushNamed(context, "/add_alarm_page");
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              trailing: const Icon(Icons.navigate_next),
              title: const Text("Clock List Page"),
              onTap: () {
                Navigator.pushNamed(context, "/clock_list_page");
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              trailing: const Icon(Icons.navigate_next),
              title: const Text("Weather List Page"),
              onTap: () {
                Navigator.pushNamed(context, "/weather_list_page");
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              trailing: const Icon(Icons.navigate_next),
              title: const Text("Weather Page"),
              onTap: () {
                Navigator.pushNamed(context, "/weather_page");
              },
            ),
          ],
        ),
      ),
    );
  }
}
