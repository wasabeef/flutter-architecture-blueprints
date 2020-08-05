import 'package:app/util/ext/context.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(context.localized.detail);
  }
}
