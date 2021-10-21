import 'package:devo_app/controllers/theme.dart';
import 'package:devo_app/controllers/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Upload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeSwitch>(context);
    final user = Provider.of<AuthStatus>(context);
    return Scaffold(
        backgroundColor: theme.light ? Colors.white : null,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: theme.swaptheme,
              icon:
                  theme.light ? Icon(Icons.dark_mode) : Icon(Icons.light_mode),
            ),
          ],
        ),
        body: UploadBody(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: theme.light ? Colors.deepPurple : Colors.white,
          foregroundColor: theme.light ? Colors.white : Colors.black,
          child: user.isAuth
              ? Icon(Icons.login_outlined)
              : Icon(Icons.logout_outlined),
          onPressed: () {},
        ));
  }
}

class UploadBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeSwitch>(context);

    return Container(
      child: Center(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  style: TextStyle(
                      color: theme.light ? Colors.black : Colors.white),
                  cursorColor: theme.light ? Colors.black : Colors.white,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                        color: theme.light ? Colors.grey : Colors.white),
                    labelText: 'Topic',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
