import 'package:devo_app/controllers/theme.dart';
import 'package:devo_app/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeSwitch>(context);
    return SplashScreenView(
      navigateRoute: Wrapper(),
      backgroundColor: theme.light ? Colors.deepPurple : Colors.black12,
      text: 'DevApp',
      textStyle: theme.light
          ? TextStyle(
              fontSize: 30,
            )
          : TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
      pageRouteTransition: PageRouteTransition.SlideTransition,
      duration: 3000,
    );
  }
}
