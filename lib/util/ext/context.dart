import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension BuildContextExt on BuildContext {
  ThemeData get theme {
    return Theme.of(this);
  }

  FocusScopeNode get focusScope {
    return FocusScope.of(this);
  }

  NavigatorState get navigator {
    return Navigator.of(this);
  }

  AppLocalizations get localized {
    return AppLocalizations.of(this);
  }

  T args<T>() {
    return ModalRoute.of(this).settings.arguments as T;
  }
}
