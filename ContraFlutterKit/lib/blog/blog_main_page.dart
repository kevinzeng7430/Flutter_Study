import 'package:flutter/material.dart';

class BlogMainPage extends StatefulWidget {
  const BlogMainPage({super.key});

  @override
  _BlogMainPageState createState() => _BlogMainPageState();
}

class _BlogMainPageState extends State<BlogMainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blog"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: ListTile(
                contentPadding: const EdgeInsets.all(20),
                trailing: const Icon(Icons.navigate_next),
                title: const Text("Blog Home Page"),
                onTap: () {
                  Navigator.pushNamed(context, "/blog_home_page");
                },
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              trailing: const Icon(Icons.navigate_next),
              title: const Text("Blog List Page One"),
              onTap: () {
                Navigator.pushNamed(context, "/blog_list_page_one");
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              trailing: const Icon(Icons.navigate_next),
              title: const Text("Blog List Page Two"),
              onTap: () {
                Navigator.pushNamed(context, "/blog_list_page_two");
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              trailing: const Icon(Icons.navigate_next),
              title: const Text("Blog List Page Three"),
              onTap: () {
                Navigator.pushNamed(context, "/blog_list_page_three");
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              trailing: const Icon(Icons.navigate_next),
              title: const Text("Blog List Page Four"),
              onTap: () {
                Navigator.pushNamed(context, "/blog_list_page_four");
              },
            ),
//            ListTile(
//              contentPadding: EdgeInsets.all(20),
//              trailing: Icon(Icons.navigate_next),
//              title: Text("Blog Staggered List Page"),
//              onTap: () {
//                Navigator.pushNamed(context, "/blog_staggered_page_four");
//              },
//            ),
            Container(
              child: ListTile(
                contentPadding: const EdgeInsets.all(20),
                trailing: const Icon(Icons.navigate_next),
                title: const Text("Blog Detail Page"),
                onTap: () {
                  Navigator.pushNamed(context, "/blog_detail_page");
                },
              ),
            ),
//            Container(
//              child: ListTile(
//                contentPadding: EdgeInsets.all(20),
//                trailing: Icon(Icons.navigate_next),
//                title: Text("Blog Featured Page"),
//                onTap: () {
//                  Navigator.pushNamed(context, "/blog_featured_page");
//                },
//              ),
//            ),
          ],
        ),
      ),
    );
  }
}
