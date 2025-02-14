import 'package:flutter/material.dart';

class Constants {
  // 应用名称
  static String appName = "Flutter Travel"; // 应用名称

  // 主题颜色定义
  static Color lightPrimary = const Color(0xfffcfcff); // 浅色主题的主背景色
  static Color darkPrimary = Colors.black; // 深色主题的主背景色
  static Color lightAccent = Colors.blueGrey[900]!; // 浅色主题的强调色
  static Color darkAccent = Colors.white; // 深色主题的强调色
  static Color lightBG = const Color(0xfffcfcff); // 浅色主题的背景色
  static Color darkBG = Colors.black; // 深色主题的背景色
  static Color badgeColor = Colors.red; // 徽章颜色

  // 定义浅色主题
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.light(
      surface: lightBG, // 表面颜色（背景色）
      primary: lightPrimary, // 主要颜色
      secondary: lightAccent, // 强调颜色
    ),
    scaffoldBackgroundColor: lightBG, // 脚手架背景颜色
    primaryColor: lightPrimary, // 主要颜色
    textSelectionTheme: TextSelectionThemeData(
      // 文本选择主题
      cursorColor: lightAccent, // 光标颜色
    ),
    appBarTheme: AppBarTheme(
      elevation: 0, // 应用栏的阴影高度
      titleTextStyle: TextStyle(
        color: darkBG, // 文本颜色
        fontSize: 18.0, // 字体大小
        fontWeight: FontWeight.w800, // 字体粗细
      ),
      // 应用栏工具栏文本样式
      toolbarTextStyle: TextStyle(
        color: darkBG, // 文本颜色
        fontSize: 18.0, // 字体大小
        fontWeight: FontWeight.w800, // 字体粗细
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.dark(
      surface: darkBG, // 表面颜色（背景色）
      primary: darkPrimary, // 主要颜色
      secondary: darkAccent, // 强调颜色
    ),
    scaffoldBackgroundColor: darkBG, // 脚手架背景颜色
    primaryColor: darkPrimary, // 主要颜色
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: darkAccent, // 光标颜色
    ),
    appBarTheme: AppBarTheme(
      elevation: 0, // 应用栏的阴影高度
      titleTextStyle: TextStyle(
        color: lightBG, // 文本颜色
        fontSize: 18.0, // 字体大小
        fontWeight: FontWeight.w800, // 字体粗细
      ),
      // 应用栏工具栏文本样式
    ),
  );
}
