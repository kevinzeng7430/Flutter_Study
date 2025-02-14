import 'package:contraflutterkit/blog/blog_home_page.dart';
import 'package:contraflutterkit/blog/blog_list_page_four.dart';
import 'package:contraflutterkit/blog/blog_list_page_one.dart';
import 'package:contraflutterkit/blog/blog_main_page.dart';
import 'package:contraflutterkit/blog/blog_staggered_grid_page.dart';
import 'package:contraflutterkit/chat/chat.dart';
import 'package:contraflutterkit/chat/chat_home_page.dart';
import 'package:contraflutterkit/chat/chat_list_page.dart';
import 'package:contraflutterkit/chat/chat_messages_page.dart';
import 'package:contraflutterkit/content/content_main_page.dart';
import 'package:contraflutterkit/content/image_text_pager.dart';
import 'package:contraflutterkit/login/login_form_one.dart';
import 'package:contraflutterkit/login/login_form_two.dart';
import 'package:contraflutterkit/login/login_main.dart';
import 'package:contraflutterkit/login/signup_form_one.dart';
import 'package:contraflutterkit/maps/location_detail.dart';
import 'package:contraflutterkit/maps/location_listing.dart';
import 'package:contraflutterkit/menu/menu_settings_main_page.dart';
import 'package:contraflutterkit/menu/settings_page_three.dart';
import 'package:contraflutterkit/onboarding/onboard_main.dart';
import 'package:contraflutterkit/onboarding/type3/pager.dart';
import 'package:contraflutterkit/onboarding/welcome_screen.dart';
import 'package:contraflutterkit/payment/payment_main_page.dart';
import 'package:contraflutterkit/payment/payment_page_one.dart';
import 'package:contraflutterkit/payment/payment_page_three.dart';
import 'package:contraflutterkit/payment/payment_page_two.dart';
import 'package:contraflutterkit/shopping/shopping_detail_page_one.dart';
import 'package:contraflutterkit/shopping/shopping_detail_page_two.dart';
import 'package:contraflutterkit/shopping/shopping_home_page.dart';
import 'package:contraflutterkit/shopping/shopping_home_page_one.dart';
import 'package:contraflutterkit/shopping/shopping_home_page_two.dart';
import 'package:contraflutterkit/shopping/shopping_list_page_type_one.dart';
import 'package:contraflutterkit/shopping/shopping_list_page_type_two.dart';
import 'package:contraflutterkit/shopping/shopping_main_page.dart';
import 'package:contraflutterkit/utils/colors.dart';
import 'package:contraflutterkit/utils/empty_screen.dart';
import 'package:flutter/material.dart';

import 'alarm/add_alarm_page.dart';
import 'alarm/alarm_list_page.dart';
import 'alarm/alarm_main_page.dart';
import 'alarm/clock_list_page.dart';
import 'alarm/weather_detail_page.dart';
import 'alarm/weather_list_page.dart';
import 'blog/blog_detail_page.dart';
import 'blog/blog_list_page_three.dart';
import 'blog/blog_list_page_two.dart';
import 'chart/charts_main_page.dart';
import 'chart/charts_page.dart';
import 'content/blog_home.dart';
import 'content/detail_screen_grid.dart';
import 'content/detail_screen_page_four.dart';
import 'content/detail_screen_page_one.dart';
import 'content/detail_screen_page_three.dart';
import 'content/detail_screen_page_two.dart';
import 'content/invite_list_page.dart';
import 'content/popular_courses_home_page.dart';
import 'content/user_list_page.dart';
import 'login/contact_us_form.dart';
import 'login/login_form_type_four.dart';
import 'login/login_form_type_three.dart';
import 'login/verification_type.dart';
import 'maps/map_main_page.dart';
import 'menu/menu_page_one.dart';
import 'menu/menu_page_two.dart';
import 'menu/settings_page_one.dart';
import 'menu/settings_page_two.dart';
import 'onboarding/type1/pager.dart';
import 'onboarding/type2/pager.dart';
import 'onboarding/type4/onboard_page_four.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contra Flutter Kit',
      theme: ThemeData(
          fontFamily: 'Montserrat',
          primarySwatch: Colors.blue,
          primaryColor: persian_blue),
      home: const MyHomePage(title: 'Contra Flutter Kit Demo'),
      routes: {
        '/onboard_all': (context) => const OnboardPageMain(),
        '/onboard_type_one': (context) => const OnboardingPagerTypeOne(),
        '/onboard_type_two': (context) => const OnboardingPagerTypeTwo(),
        '/onboard_type_three': (context) => const OnboardingPagerTypeThree(),
        '/onboard_type_four': (context) => const OnboardPageTypeFour(),
        '/empty_state': (context) => const EmptyState(),
        '/welcome_screen': (context) => const WelcomeScreenPage(),
        '/login_all': (context) => const LoginMainPage(),
        '/login_type_one': (context) => const LoginFormTypeOne(),
        '/login_type_two': (context) => const LoginFormTypeTwo(),
        '/login_type_three': (context) => const LoginFormTypeThree(),
        '/login_type_four': (context) => const LoginFormTypeFour(),
        '/signin_type_one': (context) => const SignInFormTypeOne(),
        '/login__type_verification': (context) => const VerificationType(),
        '/contact_us_form': (context) => const ContactUsForm(),
        '/chat_home': (context) => const ChatHomePage(),
        '/chat_screen_page': (context) => const ChatListPage(),
        '/chat_list_page': (context) => const ChatMessagesPage(
              chat: Chat(
                  name: "Charli",
                  message: "Please have a look",
                  time: "3.30 AM",
                  count: "2"),
            ),
        '/shopping_main_page': (context) => const ShoppingMainPage(),
        '/shopping_list_page_one': (context) => const ShoppingListPageOne(),
        '/shopping_list_page_two': (context) => const ShoppingListPageTwo(),
        '/shopping_home_page': (context) => const ShoppingHomePage(),
        '/shopping_home_page_one': (context) => const ShoppingHomePageOne(),
        '/shopping_home_page_two': (context) => const ShoppingHomePageTwo(),
        '/shopping_detail_page_one': (context) => const ShoppingDetailPageOne(),
        '/shopping_detail_page_two': (context) => const ShoppingDetailPageTwo(),
        '/blog_main_page': (context) => const BlogMainPage(),
        '/blog_home_page': (context) => const BlogHomePage(),
        '/blog_list_page_one': (context) => const BlogListPageOne(),
        '/blog_list_page_two': (context) => const BlogListPageTwo(),
        '/blog_list_page_three': (context) => const BlogListPageThree(),
        '/blog_list_page_four': (context) => const BlogListPageFour(),
        '/blog_staggered_page_four': (context) => const BlogStaggeredGridPage(),
        '/blog_detail_page': (context) => const BlogDetailPage(),
        '/blog_featured_page': (context) => const ShoppingDetailPageTwo(),
        '/payment_main_page': (context) => const PaymentMainPage(),
        '/payment_page_type_one': (context) => const PaymentPageOne(),
        '/payment_page_type_two': (context) => const PaymentPageTwo(),
        '/payment_page_type_three': (context) => const PaymentPageThree(),
        '/alarm_main_page': (context) => const AlarmMainPage(),
        '/alarm_list_page': (context) => const AlarmListPage(),
        '/add_alarm_page': (context) => const AddAlarmPage(),
        '/clock_list_page': (context) => const ClockListPage(),
        '/weather_list_page': (context) => const WeatherListPage(),
        '/weather_page': (context) => const WeatherDetailPage(),
        '/chart_main_page': (context) => const ChartMainPage(),
        '/bar_chart_page': (context) => ChartsPage(
              isBarChart: true,
            ),
        '/line_chart_page': (context) => ChartsPage(
              isBarChart: false,
            ),
        '/map_main_page': (context) => const LocationMapMainPage(),
        '/location_list_page': (context) => const LocationListingPage(),
        '/location_detail_page': (context) => const LocationDetailPage(),
        '/content_text_main_page': (context) => const ContentMainPage(),
        '/content_blog_home': (context) => const BlogHome(),
        '/detail_screen_one': (context) => const DetailScreenPageOne(),
        '/image_and_text': (context) => const ImageTextPager(),
        '/detail_screen_two': (context) => const DetailScreenPageTwo(),
        '/detail_screen_three': (context) => const DetailScreenPageThree(),
        '/detail_screen_four': (context) => const DetailScreenPageFour(),
        '/detail_screen_grid': (context) => const DetailScreenGridPage(),
        '/home_list_page': (context) => const PopularCoursesHomePage(),
        '/user_listing_page': (context) => const UserListPage(),
        '/user_invite_page': (context) => const InviteListPage(),
        '/menu_settings_main_page': (context) => const MenuSettingsMainPage(),
        '/menu_type_one': (context) => const MenuPageOne(),
        '/menu_type_two': (context) => const MenuPageTwo(),
        '/settings_type_one': (context) => const SettingsPageOne(),
        '/settings_type_two': (context) => const SettingsPageTwo(),
        '/settings_type_three': (context) => const SettingsPageThree(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              ListTile(
                contentPadding: const EdgeInsets.all(20),
                trailing: const Icon(Icons.navigate_next),
                title: const Text("Onboarding and Splash"),
                onTap: () {
                  Navigator.pushNamed(context, "/onboard_all");
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(20),
                trailing: const Icon(Icons.navigate_next),
                title: const Text("Forms, Login, Signup"),
                onTap: () {
                  Navigator.pushNamed(context, "/login_all");
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(20),
                trailing: const Icon(Icons.navigate_next),
                title: const Text("Chatting Screens"),
                onTap: () {
                  Navigator.pushNamed(context, "/chat_home");
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(20),
                trailing: const Icon(Icons.navigate_next),
                title: const Text("Shopping Screens"),
                onTap: () {
                  Navigator.pushNamed(context, "/shopping_main_page");
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(20),
                trailing: const Icon(Icons.navigate_next),
                title: const Text("Blog Screens"),
                onTap: () {
                  Navigator.pushNamed(context, "/blog_main_page");
                },
              ),
              Container(
                child: ListTile(
                  contentPadding: const EdgeInsets.all(20),
                  trailing: const Icon(Icons.navigate_next),
                  title: const Text("Payment"),
                  onTap: () {
                    Navigator.pushNamed(context, "/payment_main_page");
                  },
                ),
              ),
              Container(
                child: ListTile(
                  contentPadding: const EdgeInsets.all(20),
                  trailing: const Icon(Icons.navigate_next),
                  title: const Text("Alarm, Clock, Weather"),
                  onTap: () {
                    Navigator.pushNamed(context, "/alarm_main_page");
                  },
                ),
              ),
              Container(
                child: ListTile(
                  contentPadding: const EdgeInsets.all(20),
                  trailing: const Icon(Icons.navigate_next),
                  title: const Text("Data and Statistics"),
                  onTap: () {
                    Navigator.pushNamed(context, "/chart_main_page");
                  },
                ),
              ),
              Container(
                child: ListTile(
                  contentPadding: const EdgeInsets.all(20),
                  trailing: const Icon(Icons.navigate_next),
                  title: const Text("Location And Map"),
                  onTap: () {
                    Navigator.pushNamed(context, "/map_main_page");
                  },
                ),
              ),
              Container(
                child: ListTile(
                  contentPadding: const EdgeInsets.all(20),
                  trailing: const Icon(Icons.navigate_next),
                  title: const Text("Content, Text Details"),
                  onTap: () {
                    Navigator.pushNamed(context, "/content_text_main_page");
                  },
                ),
              ),
              Container(
                child: ListTile(
                  contentPadding: const EdgeInsets.all(20),
                  trailing: const Icon(Icons.navigate_next),
                  title: const Text("Menu and Settings"),
                  onTap: () {
                    Navigator.pushNamed(context, "/menu_settings_main_page");
                  },
                ),
              ),
/*              Container(
                child: ListTile(
                  contentPadding: EdgeInsets.all(20),
                  trailing: Icon(Icons.navigate_next),
                  title: Text("Dialogs, Filters, Toasts"),
                  onTap: () {
                    Navigator.pushNamed(context, "/empty_state");
                  },
                ),
              ),
              Container(
                child: ListTile(
                  contentPadding: EdgeInsets.all(20),
                  trailing: Icon(Icons.navigate_next),
                  title: Text("Profile"),
                  onTap: () {
                    Navigator.pushNamed(context, "/empty_state");
                  },
                ),
              ),
              Container(
                child: ListTile(
                  contentPadding: EdgeInsets.all(20),
                  trailing: Icon(Icons.navigate_next),
                  title: Text("Menus"),
                  onTap: () {
                    Navigator.pushNamed(context, "/empty_state");
                  },
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.all(20),
                trailing: Icon(Icons.navigate_next),
                title: Text("Profile"),
                onTap: () {
                  Navigator.pushNamed(context, "/empty_state");
                },
              )*/
            ],
          ),
        ),
      ),
    );
  }
}
