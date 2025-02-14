import 'package:flutter/material.dart';

class ContentMainPage extends StatefulWidget {
  const ContentMainPage({super.key});

  @override
  _ContentMainPageState createState() => _ContentMainPageState();
}

class _ContentMainPageState extends State<ContentMainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Content, Text Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              trailing: const Icon(Icons.navigate_next),
              title: const Text("Blog Home"),
              onTap: () {
                Navigator.pushNamed(context, "/content_blog_home");
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              trailing: const Icon(Icons.navigate_next),
              title: const Text("Detail Screen One"),
              onTap: () {
                Navigator.pushNamed(context, "/detail_screen_one");
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              trailing: const Icon(Icons.navigate_next),
              title: const Text("Image and Text"),
              onTap: () {
                Navigator.pushNamed(context, "/image_and_text");
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              trailing: const Icon(Icons.navigate_next),
              title: const Text("Detail Screen Two"),
              onTap: () {
                Navigator.pushNamed(context, "/detail_screen_two");
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              trailing: const Icon(Icons.navigate_next),
              title: const Text("Detail Screen Three"),
              onTap: () {
                Navigator.pushNamed(context, "/detail_screen_three");
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              trailing: const Icon(Icons.navigate_next),
              title: const Text("Detail Screen Four"),
              onTap: () {
                Navigator.pushNamed(context, "/detail_screen_four");
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              trailing: const Icon(Icons.navigate_next),
              title: const Text("Details Images in Grid"),
              onTap: () {
                Navigator.pushNamed(context, "/detail_screen_grid");
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              trailing: const Icon(Icons.navigate_next),
              title: const Text("Home Listing"),
              onTap: () {
                Navigator.pushNamed(context, "/home_list_page");
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              trailing: const Icon(Icons.navigate_next),
              title: const Text("User Listing"),
              onTap: () {
                Navigator.pushNamed(context, "/user_listing_page");
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              trailing: const Icon(Icons.navigate_next),
              title: const Text("User Invite Page"),
              onTap: () {
                Navigator.pushNamed(context, "/user_invite_page");
              },
            ),
          ],
        ),
      ),
    );
  }
}
