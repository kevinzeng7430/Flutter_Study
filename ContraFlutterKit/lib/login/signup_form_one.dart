import 'package:contraflutterkit/custom_widgets/button_plain_with_shadow.dart';
import 'package:contraflutterkit/custom_widgets/button_round_with_shadow.dart';
import 'package:contraflutterkit/login/login_input_password_text.dart';
import 'package:contraflutterkit/login/rich_text.dart';
import 'package:contraflutterkit/utils/colors.dart';
import 'package:flutter/material.dart';

import 'contra_text.dart';
import 'login_input_email_text.dart';

class SignInFormTypeOne extends StatelessWidget {
  const SignInFormTypeOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 5,
                child: ListView(
                  padding: const EdgeInsets.all(24),
                  children: <Widget>[
                    const ContraText(
                      text: "Sign up",
                      alignment: Alignment.centerLeft,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      "You have chance to create new account if you really want to.",
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
                      text: "Full Name",
                      iconPath: "assets/icons/user.svg",
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const LoginEmailText(
                      text: "Email address",
                      iconPath: "assets/icons/mail.svg",
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
                      text: "Sign up",
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
          Positioned(
            left: 24,
            top: 80,
            child: ButtonRoundWithShadow(
              size: 48,
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
