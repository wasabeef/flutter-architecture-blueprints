import 'package:app/ui/app_theme.dart';
import 'package:app/ui/route/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = context.read(appThemeNotifierProvider);
    final setting =
        useProvider(appThemeNotifierProvider.select((value) => value.setting));
    useFuture(
      useMemoized(appTheme.themeMode, [setting]),
      initialData: ThemeMode.light,
    );
    final appRouter = useMemoized(() => AppRouter());
    return MaterialApp.router(
      title: 'Flutter Architecture Blueprints',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: setting,
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
    );
  }
}
