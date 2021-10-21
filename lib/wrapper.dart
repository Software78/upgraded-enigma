import 'package:devo_app/controllers/theme.dart';
import 'package:devo_app/controllers/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeSwitch>(context);
    final user = Provider.of<AuthStatus>(context);
    return Scaffold(
        backgroundColor: theme.light ? Colors.white : null,
        appBar: AppBar(
          title: Text('DevApp'),
          actions: [
            IconButton(
              onPressed: theme.swaptheme,
              icon:
                  theme.light ? Icon(Icons.dark_mode) : Icon(Icons.light_mode),
            ),
          ],
        ),
        body: Container(
          child: Center(
            child: ElevatedButton(
              child: Text('Post'),
              onPressed: () {
                Navigator.pushNamed(context, '/upload');
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: theme.light ? Colors.deepPurple : Colors.white,
          foregroundColor: theme.light ? Colors.white : Colors.black,
          child: user.isAuth
              ? Icon(Icons.login_outlined)
              : Icon(Icons.logout_outlined),
          onPressed: () {
            if (user.isAuth == false) {
              user.handleSignIn();
            } else {
              user.handleSignOut();
            }
          },
        ));
  }
}
