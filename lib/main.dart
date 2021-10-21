import 'package:devo_app/addpost.dart';
import 'package:devo_app/controllers/user.dart';
import 'package:devo_app/splash.dart';
import 'package:devo_app/widgets/thememode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => ThemeSwitch(),
      ),
      ChangeNotifierProvider(
        create: (_) => AuthStatus(),
      ),
    ],
    child: BaseApp(),
  ));
}

class BaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeSwitch>(context);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      theme: theme.light ? lightMode() : darkMode(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(),
        '/upload': (context) => Upload(),
      },
    );
  }
}
