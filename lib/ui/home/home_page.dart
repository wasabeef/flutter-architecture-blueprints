import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../util/error_snackbar.dart';
import '../../util/ext/async_snapshot.dart';
import '../app_theme.dart';
import '../component/article_item.dart';
import '../component/loading.dart';
import 'home_view_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(L10n.of(context).home, style: Get.textTheme.headline1),
          actions: [
            // action button
            IconButton(
              icon: const Icon(Icons.color_lens),
              onPressed: () async => context
                  .read(appThemeNotifierProvider)
                  .toggle()
                  .catchError((error) {
                showErrorSnackbar(
                    L10n.of(context).error, L10n.of(context).failedSwitchTheme);
              }),
            ),
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () =>
                  context.read(homeViewModelNotifierProvider).fetchNews(),
            ),
          ],
        ),
        body: Center(
          child: HookBuilder(
            builder: (context) {
              final homeViewModel = context.read(homeViewModelNotifierProvider);
              final news = useProvider(
                  homeViewModelNotifierProvider.select((value) => value.news));
              final snapshot = useFuture(
                  useMemoized(homeViewModel.fetchNews, [news.toString()]));

              if (snapshot.isWaiting) return const Loading();

              return news.when(success: (data) {
                if (data.articles.isEmpty) {
                  return const Text('Empty screen');
                }
                return ListView.builder(
                  itemCount: data.articles.length,
                  itemBuilder: (_, index) {
                    return ArticleItem(data.articles[index]);
                  },
                );
              }, failure: (e) {
                return Text('Error Screen: $e');
              });
            },
          ),
        ));
  }
}
