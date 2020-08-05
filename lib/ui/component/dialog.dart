import 'package:app/util/ext/context.dart';
import 'package:flutter/material.dart';

void showSimpleDialog(BuildContext context,
    {String title, String text, VoidCallback onPressed}) {
  showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(title),
          content: Text(text),
          actions: <Widget>[
            FlatButton(
              child: Text(
                context.localized.cancel,
                style: TextStyle(color: context.theme.colorScheme.secondary),
              ),
              onPressed: () => context.navigator.pop(),
            ),
            FlatButton(
              child: Text(
                context.localized.ok,
                style: TextStyle(color: context.theme.colorScheme.secondary),
              ),
              onPressed: onPressed,
            ),
          ],
        );
      });
}
