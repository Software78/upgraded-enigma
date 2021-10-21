import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ThemeSwitch extends ChangeNotifier {
  bool light = false;

  swaptheme() async {
    light = !light;
    notifyListeners();
    if (light == true) {
      Fluttertoast.showToast(
        msg: 'light mode',
      );
    } else {
      Fluttertoast.showToast(msg: 'dark mode');
    }
  }
}
