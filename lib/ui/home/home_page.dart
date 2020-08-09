import 'package:app/ui/app_theme.dart';
import 'package:app/ui/component/article_item.dart';
import 'package:app/ui/component/loading.dart';
import 'package:app/ui/home/home_view_model.dart';
import 'package:app/util/ext/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final homeViewModel = useProvider(homeViewModelNotifierProvider);
    final getNews = useMemoized(() => homeViewModel.getNews());
    final snapshot = useFuture(getNews);
    final theme = useProvider(appThemeNotifierProvider);

    return Scaffold(
        appBar: AppBar(
          title: Text(context.localized.home),
          actions: [
            // action button
            IconButton(
              icon: const Icon(Icons.color_lens),
              onPressed: () async => theme.toggle(),
            ),
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () async => getNews,
            ),
          ],
        ),
        body: Center(
            child: EasyRefresh.builder(
          builder: (context, physics, header, footer) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.articles.length,
                itemBuilder: (_, index) {
                  return ArticleItem(article: snapshot.data.articles[index]);
                },
              );
            } else {
              return const Loading();
            }
          },
          onRefresh: () async {
            await getNews;
          },
          onLoad: () async {
            await getNews;
          },
        )));
  }
}
