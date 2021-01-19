import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';

void iconPackChooser(BuildContext context) {
  showPlatformDialog(
    context: context,
    builder: (_) => BasicDialogAlert(
      title: Text("Select account"),
      content: Container(
        height: 200,
        child: ListView(
          children: <Widget>[],
        ),
      ),
      actions: <Widget>[
        BasicDialogAction(
          title: Text("Choose"),
          onPressed: () {},
        ),
        BasicDialogAction(
          title: Text("Cancel"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}
