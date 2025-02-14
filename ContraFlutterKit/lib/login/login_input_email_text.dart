import 'package:contraflutterkit/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginEmailText extends StatelessWidget {
  final String text;
  final String iconPath;

  const LoginEmailText({super.key, required this.text,required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(
            hintText: text,
            hintStyle: const TextStyle(
                fontSize: 21, fontWeight: FontWeight.w500, color: wood_smoke),
            contentPadding: const EdgeInsets.all(16),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: black),
                borderRadius: BorderRadius.all(Radius.circular(16))),
            disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: black),
                borderRadius: BorderRadius.all(Radius.circular(16))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: black),
                borderRadius: BorderRadius.all(Radius.circular(16))),
            border: const OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: black),
                borderRadius: BorderRadius.all(Radius.circular(16))),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SvgPicture.asset(
                iconPath,
                height: 24,
                width: 24,
              ),
            )),
      ),
    );
  }
}
