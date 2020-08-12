import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

@immutable
class Message {
  const Message(this.locale);

  final Locale locale;

  String get ok => Intl.message(
        'OK',
        name: 'ok',
        desc: 'Ok button',
      );

  String get cancel => Intl.message(
        'CANCEL',
        name: 'cancel',
        desc: 'Cancel button',
      );

  String get home => Intl.message(
        'Home',
        name: 'home',
        desc: 'Home page',
      );

  String get detail => Intl.message(
        'Detail',
        name: 'detail',
        desc: 'Detail page',
      );
}
