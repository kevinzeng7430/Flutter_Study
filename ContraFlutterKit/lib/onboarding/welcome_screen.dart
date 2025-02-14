import 'dart:io';

import 'package:contraflutterkit/utils/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreenPage extends StatelessWidget {
  const WelcomeScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: persian_blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            kIsWeb || Platform.isIOS
                ? AppBar(
                    backgroundColor: persian_blue,
                    elevation: 0,
                  )
                : const SizedBox(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/icons/logo_mark.svg",
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Welcome To Contra Flutter Kit",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 36, color: selago, fontWeight: FontWeight.w800),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "coded by",
                    style: TextStyle(fontSize: 18, color: selago),
                  ),
                ),
                RichText(
                  text: const TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: "@nathansdev",
                        style: TextStyle(
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ))
                  ]),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
