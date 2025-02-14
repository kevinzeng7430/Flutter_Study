import 'package:flutter/material.dart';

class OnboardPageMain extends StatefulWidget {
  const OnboardPageMain({super.key});

  @override
  _OnboardPageMainState createState() => _OnboardPageMainState();
}

class _OnboardPageMainState extends State<OnboardPageMain> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Onboarding"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              trailing: const Icon(Icons.navigate_next),
              title: const Text("Type One"),
              onTap: () {
                Navigator.pushNamed(context, "/onboard_type_one");
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              trailing: const Icon(Icons.navigate_next),
              title: const Text("Type Two"),
              onTap: () {
                Navigator.pushNamed(context, "/onboard_type_two");
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              trailing: const Icon(Icons.navigate_next),
              title: const Text("Type Three"),
              onTap: () {
                Navigator.pushNamed(context, "/onboard_type_three");
              },
            ),
            Container(
              child: ListTile(
                contentPadding: const EdgeInsets.all(20),
                trailing: const Icon(Icons.navigate_next),
                title: const Text("Type Four"),
                onTap: () {
                  Navigator.pushNamed(context, "/onboard_type_four");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
