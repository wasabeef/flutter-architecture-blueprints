import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

void showSimpleDialog(BuildContext context,
    {String title, String text, VoidCallback onPressed}) {
  showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(title),
          content: Text(text),
          actions: <Widget>[
            FlatButton(
              child: Text(
                AppLocalizations.of(context).cancel,
                style: TextStyle(color: Get.theme.colorScheme.secondary),
              ),
              onPressed: Get.back,
            ),
            FlatButton(
              child: Text(
                AppLocalizations.of(context).ok,
                style: TextStyle(color: Get.theme.colorScheme.secondary),
              ),
              onPressed: onPressed,
            ),
          ],
        );
      });
}
