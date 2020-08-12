import 'package:app/l10n/message.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'message.dart';
import 'messages_all.dart';

class Localized {
  Localized(Locale locale) : message = Message(locale);

  final Message message;

  static Future<Localized> load(Locale locale) async {
    final name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    final initialized = await initializeMessages(localeName);
    assert(initialized);
    Intl.defaultLocale = localeName;
    return Localized(locale);
  }

  static Message of(BuildContext context) {
    return Localizations.of<Localized>(context, Localized).message;
  }
}
