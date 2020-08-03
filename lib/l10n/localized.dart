import 'package:app/l10n/message.dart';
import 'package:flutter/widgets.dart';

class Localized {
  Localized(Locale locale) : message = Message.of(locale);

  final Message message;

  static Message of(BuildContext context) {
    return Localizations.of<Localized>(context, Localized).message;
  }
}
