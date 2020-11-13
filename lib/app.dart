import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'constants.dart';
import 'ui/app_theme.dart';
import 'ui/component/loading.dart';
import 'ui/detail/datail_page.dart';
import 'ui/home/home_page.dart';

class App extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = context.read(appThemeNotifierProvider);
    final setting =
        useProvider(appThemeNotifierProvider.select((value) => value.setting));
    final snapshot =
        useFuture(useMemoized(() => appTheme.themeData, [setting]));

    return snapshot.hasData
        ? GetMaterialApp(
            title: 'Flutter Architecture Blueprints',
            theme: snapshot.data ?? lightTheme,
            darkTheme: darkTheme,
            home: HomePage(),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            routes: {
              Constants.pageHome: (context) => HomePage(),
              Constants.pageDetail: (context) => DetailPage(),
            },
          )
        : const Center(child: Loading());
  }
}
