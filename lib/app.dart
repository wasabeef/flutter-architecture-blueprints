import 'package:app/constants.dart';
import 'package:app/l10n/delegate.dart';
import 'package:app/ui/app_theme.dart';
import 'package:app/ui/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Architecture Blueprints',
      theme: useProvider(appThemeNotifierProvider.state),
      home: HomePage(),
      localizationsDelegates: const [
        L10nDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('ja')],
      routes: {
        Constants.PAGE_HOME: (context) => HomePage(),
      },
    );
  }
}
