import 'package:app/gen/assets.gen.dart';
import 'package:app/ui/hook/use_l10n.dart';
import 'package:app/ui/route/app_route.gr.dart';
import 'package:app/ui/theme/app_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = useProvider(appThemeProvider);
    final l10n = useL10n();
    return AutoTabsScaffold(
      routes: const [
        NewsRoute(),
        VideoRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: tabsRouter.setActiveIndex,
          iconSize: 20,
          items: [
            BottomNavigationBarItem(
              icon: Assets.svgs.news.svg(
                width: 20,
                color: tabsRouter.current.name == NewsRoute.name
                    ? theme.appColors.accent
                    : theme.appColors.disabled,
              ),
              label: l10n.news,
            ),
            BottomNavigationBarItem(
              icon: Assets.svgs.video.svg(
                width: 20,
                color: tabsRouter.current.name == VideoRoute.name
                    ? theme.appColors.accent
                    : theme.appColors.disabled,
              ),
              label: l10n.news,
            ),
          ],
        );
      },
    );
  }
}
