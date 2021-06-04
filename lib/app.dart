import 'package:app/ui/route/app_route.dart';
import 'package:app/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final theme = useProvider(appThemeProvider);
    final themeMode = useProvider(appThemeModeProvider);
    final appRouter = useMemoized(() => AppRouter());
    return MaterialApp.router(
      theme: theme.data,
      darkTheme: AppTheme.dark().data,
      themeMode: themeMode,
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
    );
  }
}
