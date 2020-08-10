import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:app/util/ext/context.dart';

void toast(BuildContext context, String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: context.theme.backgroundColor,
      textColor: context.theme.textTheme.bodyText1.color,
      fontSize: context.theme.textTheme.bodyText1.fontSize);
}
