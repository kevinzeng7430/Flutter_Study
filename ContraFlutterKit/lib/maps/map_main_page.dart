import 'package:flutter/material.dart';

class LocationMapMainPage extends StatefulWidget {
  const LocationMapMainPage({super.key});

  @override
  _LocationMapMainPageState createState() => _LocationMapMainPageState();
}

class _LocationMapMainPageState extends State<LocationMapMainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map and Location"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              trailing: const Icon(Icons.navigate_next),
              title: const Text("Locations Listing"),
              onTap: () {
                Navigator.pushNamed(context, "/location_list_page");
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              trailing: const Icon(Icons.navigate_next),
              title: const Text("Location Detail Page"),
              onTap: () {
                Navigator.pushNamed(context, "/location_detail_page");
              },
            ),
          ],
        ),
      ),
    );
  }
}
