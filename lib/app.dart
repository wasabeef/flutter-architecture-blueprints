import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'constants.dart';
import 'ui/app_theme.dart';
import 'ui/detail/datail_page.dart';
import 'ui/home/home_page.dart';
import 'ui/signIn/sign_in_page.dart';

class App extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = context.read(appThemeNotifierProvider);
    final setting =
        useProvider(appThemeNotifierProvider.select((value) => value.setting));
    useFuture(useMemoized(appTheme.themeMode, [setting]));
    return GetMaterialApp(
      title: 'Flutter Architecture Blueprints',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: setting ?? ThemeMode.light,
      home: HomePage(),
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      routes: {
        Constants.pageHome: (context) => HomePage(),
        Constants.pageSignIn: (context) => SignInPage(),
        Constants.pageDetail: (context) => DetailPage(),
      },
    );
  }
}
