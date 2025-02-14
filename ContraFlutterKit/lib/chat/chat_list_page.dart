import 'dart:io';

import 'package:contraflutterkit/chat/chat_messages_page.dart';
import 'package:contraflutterkit/chat/chat_search_page.dart';
import 'package:contraflutterkit/custom_widgets/button_round_with_shadow.dart';
import 'package:contraflutterkit/custom_widgets/custom_search_text.dart';
import 'package:contraflutterkit/login/contra_text.dart';
import 'package:contraflutterkit/utils/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'chat.dart';
import 'chat_list_item.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  final List<Chat> _items = <Chat>[];
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _items.add(const Chat(
        name: "Charli",
        message: "Please have a look",
        time: "3.30 AM",
        count: "2"));
    _items.add(const Chat(
        name: "Chandran",
        message: "Call me after 5",
        time: "3.30 AM",
        count: "2"));
    _items.add(const Chat(
        name: "Harray",
        message: "No food left in the kitchen",
        time: "3.30 AM",
        count: ""));
    _items.add(const Chat(
        name: "Leonard",
        message: "Get groceries while coming",
        time: "3.30 AM",
        count: ""));
    _items.add(const Chat(
        name: "Sheldon",
        message: "Please have a look",
        time: "3.30 AM",
        count: ""));
    _items.add(const Chat(
        name: "Chirag",
        message: "Please have a look",
        time: "3.30 AM",
        count: "2"));
    _items.add(const Chat(
        name: "Charli",
        message: "Please have a look",
        time: "3.30 AM",
        count: "4"));
    _items.add(const Chat(
        name: "Karthick",
        message: "Can we have coffe?",
        time: "3.30 AM",
        count: "4"));
    _items.add(const Chat(
        name: "Murali",
        message: "Lets meet tommorrow",
        time: "3.30 AM",
        count: "5"));
    _items.add(const Chat(
        name: "Charli",
        message: "Please have a look",
        time: "3.30 AM",
        count: "2"));
    _items.add(const Chat(
        name: "Charli",
        message: "Please have a look",
        time: "3.30 AM",
        count: "2"));
    _items.add(const Chat(
        name: "Charli",
        message: "Please have a look",
        time: "3.30 AM",
        count: "2"));
    _items.add(const Chat(
        name: "Charli",
        message: "Please have a look",
        time: "3.30 AM",
        count: "2"));
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 56,
              ),
              Row(
                children: [
           kIsWeb||       Platform.isIOS
                      ? ButtonRoundWithShadow(
                          size: 48,
                          borderColor: wood_smoke,
                          color: white,
                          callback: () {
                            Navigator.pop(context);
                          },
                          shadowColor: wood_smoke,
                          iconPath: "assets/icons/arrow_back.svg")
                      : const SizedBox(),
               kIsWeb||   Platform.isIOS
                      ? const SizedBox(
                          width: 20,
                        )
                      : const SizedBox(),
                  const ContraText(
                    alignment: Alignment.centerLeft,
                    text: "Chat",
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              CustomSearchText(
                iconPath: "assets/icons/ic_search.svg",
                text: "Search with love ...",
                enable: false,
                callback: () {
                  _launchSearchMessage();
                },
                controller: _textEditingController,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ChatListItemWidget(
                      chat: _items[index],
                      callback: () {
                        _launchChatMessage(_items[index]);
                      },
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  _launchChatMessage(Chat item) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return ChatMessagesPage(
        chat: item,
      );
    }));
  }

  _launchSearchMessage() {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return const ChatSearchPage();
    }));
  }
}
