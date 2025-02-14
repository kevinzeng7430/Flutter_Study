import 'package:flutter/material.dart';

class LoginMainPage extends StatefulWidget {
  const LoginMainPage({super.key});

  @override
  _LoginMainPageState createState() => _LoginMainPageState();
}

class _LoginMainPageState extends State<LoginMainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              trailing: const Icon(Icons.navigate_next),
              title: const Text("Type One"),
              onTap: () {
                Navigator.pushNamed(context, "/login_type_one");
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              trailing: const Icon(Icons.navigate_next),
              title: const Text("Type Two"),
              onTap: () {
                Navigator.pushNamed(context, "/login_type_two");
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              trailing: const Icon(Icons.navigate_next),
              title: const Text("Type Three"),
              onTap: () {
                Navigator.pushNamed(context, "/login_type_three");
              },
            ),
            Container(
              child: ListTile(
                contentPadding: const EdgeInsets.all(20),
                trailing: const Icon(Icons.navigate_next),
                title: const Text("Type Four"),
                onTap: () {
                  Navigator.pushNamed(context, "/login_type_four");
                },
              ),
            ),
            Container(
              child: ListTile(
                contentPadding: const EdgeInsets.all(20),
                trailing: const Icon(Icons.navigate_next),
                title: const Text("Type Verification"),
                onTap: () {
                  Navigator.pushNamed(context, "/login__type_verification");
                },
              ),
            ),
            Container(
              child: ListTile(
                contentPadding: const EdgeInsets.all(20),
                trailing: const Icon(Icons.navigate_next),
                title: const Text("Type Signup"),
                onTap: () {
                  Navigator.pushNamed(context, "/signin_type_one");
                },
              ),
            ),
            Container(
              child: ListTile(
                contentPadding: const EdgeInsets.all(20),
                trailing: const Icon(Icons.navigate_next),
                title: const Text("Contact Us Form"),
                onTap: () {
                  Navigator.pushNamed(context, "/contact_us_form");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
