import 'package:flutter/material.dart';

ThemeData themeData() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: appBarTheme(),
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
      inputDecorationTheme: inputDecorationTheme());
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    // color: Colors.white,
    elevation: 2,
    iconTheme: IconThemeData(color: Colors.black),
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(28), gapPadding: 10);
  return InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(horizontal: 45, vertical: 20),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      border: outlineInputBorder);
}
