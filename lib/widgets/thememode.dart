import 'package:flutter/material.dart';

ThemeData lightMode() {
  return ThemeData(
    primaryColor: Colors.deepPurple,
    brightness: Brightness.dark,
  );
}

ThemeData darkMode() {
  return ThemeData(
    primaryColor: Colors.black,
    brightness: Brightness.dark,
  );
}
