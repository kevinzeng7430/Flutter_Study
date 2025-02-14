import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GuessPage extends StatefulWidget {
  const GuessPage({super.key, required this.title});
  final String title;

  @override
  State<GuessPage> createState() => _GuessPageState();
}

class _GuessPageState extends State<GuessPage> {
  int _value = 0;

  final Random _random = Random();

  void getRandomNumber() {
    setState(() {
      _value = _random.nextInt(100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.black,
        ),
        titleSpacing: 0,

        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        actions: [
          IconButton(
            splashRadius: 20, 
            onPressed: (){},  //实现点击事件
            icon: const Icon(
              Icons.saved_search,
              color: Colors.blue,
            ),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 4.0,
        shadowColor: const Color.fromARGB(255, 220, 236, 221),
        title: const TextField(
          keyboardType: TextInputType.number,
          //decoration装饰，这里是输入框的装饰
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            constraints: BoxConstraints(maxHeight: 35),
            border: UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            hintText: "input 0~99",
            hintStyle: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10), 
          ),
        ),
      ),
      //Stack 允许你将多个widget层叠在一起
      body: Stack(
         children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.redAccent,
                    child: const Text(
                      '大了',
                      style: TextStyle(
                        fontSize: 54,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ), 
                ),
                 Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.blue,
                    child: const Text(
                      '小了',
                      style: TextStyle(
                        fontSize: 54,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ), 
                ),
              ],
            ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Get Random Number',
                ),
                Text(
                  '$_value',
                  style: Theme.of(context).textTheme.headlineMedium,
                )
              ],
            ),
          ),
      ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getRandomNumber,
        tooltip: 'getnumber',
        child: const Icon(Icons.generating_tokens_outlined),
        ),
    );
  }
}
