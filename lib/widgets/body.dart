import 'package:devo_app/controllers/theme.dart';
import 'package:devo_app/widgets/loadingspinner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

StreamBuilder body() {
  return StreamBuilder(
    builder: (context, snapshot) {
      if (snapshot.data != null) {
        return ListView.builder(
          itemBuilder: _buildList,
          itemCount: 99,
        );
      } else if (snapshot.connectionState == ConnectionState.none) {
        return Container(
          child: AlertDialog(
            title: Text('Error In Connection'),
          ),
        );
      } else {
        return loading();
      }
    },
    stream: null,
  );
}

Widget _buildList(context, int index) {
  final theme = Provider.of<ThemeSwitch>(context);
  return InkWell(
    onTap: () {},
    child: ListTile(
      title: Text(
        'Title',
        style: TextStyle(color: theme.light ? Colors.black : null),
      ),
      subtitle: Text(
        'subtitle',
        style: TextStyle(color: theme.light ? Colors.black : null),
      ),
    ),
  );
}
