import 'package:flutter/material.dart';

class ShoppingMainPage extends StatefulWidget {
  const ShoppingMainPage({super.key});

  @override
  _ShoppingMainPageState createState() => _ShoppingMainPageState();
}

class _ShoppingMainPageState extends State<ShoppingMainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              trailing: const Icon(Icons.navigate_next),
              title: const Text("Shopping List Page One"),
              onTap: () {
                Navigator.pushNamed(context, "/shopping_list_page_one");
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              trailing: const Icon(Icons.navigate_next),
              title: const Text("Shopping List Page Two"),
              onTap: () {
                Navigator.pushNamed(context, "/shopping_list_page_two");
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              trailing: const Icon(Icons.navigate_next),
              title: const Text("Shopping Home Page"),
              onTap: () {
                Navigator.pushNamed(context, "/shopping_home_page");
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              trailing: const Icon(Icons.navigate_next),
              title: const Text("Shopping Home Page One"),
              onTap: () {
                Navigator.pushNamed(context, "/shopping_home_page_one");
              },
            ),
            Container(
              child: ListTile(
                contentPadding: const EdgeInsets.all(20),
                trailing: const Icon(Icons.navigate_next),
                title: const Text("Shopping Home Page Two"),
                onTap: () {
                  Navigator.pushNamed(context, "/shopping_home_page_two");
                },
              ),
            ),
            Container(
              child: ListTile(
                contentPadding: const EdgeInsets.all(20),
                trailing: const Icon(Icons.navigate_next),
                title: const Text("Shopping Detail Page One"),
                onTap: () {
                  Navigator.pushNamed(context, "/shopping_detail_page_one");
                },
              ),
            ),
            Container(
              child: ListTile(
                contentPadding: const EdgeInsets.all(20),
                trailing: const Icon(Icons.navigate_next),
                title: const Text("Shopping Detail Page Two"),
                onTap: () {
                  Navigator.pushNamed(context, "/shopping_detail_page_two");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
