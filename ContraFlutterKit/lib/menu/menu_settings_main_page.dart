import 'package:flutter/material.dart';

class MenuSettingsMainPage extends StatefulWidget {
  const MenuSettingsMainPage({super.key});

  @override
  _MenuSettingsMainPageState createState() => _MenuSettingsMainPageState();
}

class _MenuSettingsMainPageState extends State<MenuSettingsMainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu and Settings"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              trailing: const Icon(Icons.navigate_next),
              title: const Text("Menu Type One"),
              onTap: () {
                Navigator.pushNamed(context, "/menu_type_one");
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              trailing: const Icon(Icons.navigate_next),
              title: const Text("Menu Type Two"),
              onTap: () {
                Navigator.pushNamed(context, "/menu_type_two");
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              trailing: const Icon(Icons.navigate_next),
              title: const Text("Settings Type One"),
              onTap: () {
                Navigator.pushNamed(context, "/settings_type_one");
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              trailing: const Icon(Icons.navigate_next),
              title: const Text("Settings Type Two"),
              onTap: () {
                Navigator.pushNamed(context, "/settings_type_two");
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              trailing: const Icon(Icons.navigate_next),
              title: const Text("Settings Type Three"),
              onTap: () {
                Navigator.pushNamed(context, "/settings_type_three");
              },
            ),
          ],
        ),
      ),
    );
  }
}
