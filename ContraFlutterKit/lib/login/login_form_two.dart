import 'package:contraflutterkit/custom_widgets/button_plain_with_shadow.dart';
import 'package:contraflutterkit/custom_widgets/button_round_with_shadow.dart';
import 'package:contraflutterkit/login/rich_text.dart';
import 'package:contraflutterkit/utils/colors.dart';
import 'package:flutter/material.dart';

import 'contra_text.dart';
import 'login_input_email_text.dart';
import 'login_input_password_text.dart';

class LoginFormTypeTwo extends StatelessWidget {
  const LoginFormTypeTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: white,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: <Widget>[
                const Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 56,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: <Widget>[
                      const ContraText(
                        text: "Login",
                        alignment: Alignment.centerLeft,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        "You don’t think you should login first and behave like human not robot.",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 21,
                            color: trout,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const LoginEmailText(
                        text: "Email address",
                        iconPath: "assets/icons/user.svg",
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const LoginPasswordText(
                        text: "..........",
                        iconPath: "assets/icons/lock.svg",
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ButtonPlainWithShadow(
                        text: "Sign in",
                        shadowColor: wood_smoke,
                        borderColor: wood_smoke,
                        callback: () {},
                        color: lightening_yellow,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const CustomRichText(
                        alignment: Alignment.centerLeft,
                        text_one: "You are new? ",
                        text_second: "Create new",
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 24,
            top: 80,
            child: ButtonRoundWithShadow(size: 48,
              iconPath: "assets/icons/close.svg",
              borderColor: black,
              shadowColor: black,
              color: white,
              callback: () {
                Navigator.of(context).pop();
              },
            ),
          )
        ],
      ),
    );
  }
}
