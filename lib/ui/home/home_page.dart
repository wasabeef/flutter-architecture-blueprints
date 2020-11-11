import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../util/ext/context.dart';
import '../app_theme.dart';
import '../component/article_item.dart';
import '../component/loading.dart';
import '../error_notifier.dart';
import 'home_view_model.dart';

class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(context.localized.home),
          actions: [
            // action button
            IconButton(
              icon: const Icon(Icons.color_lens),
              onPressed: () async =>
                  context.read(appThemeNotifierProvider).toggle(),
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
              final error = useProvider(errorNotifierProvider);
              if (!error.hasBeenHandled) {
                Fluttertoast.showToast(
                    msg: error.getErrorIfNotHandled().message);
                return const Text('Error Screen');
              }
              final homeViewModel = context.read(homeViewModelNotifierProvider);
              final news = useProvider(
                  homeViewModelNotifierProvider.select((value) => value.news));
              final snapshot = useFuture(useMemoized(homeViewModel.fetchNews,
                  // These Keys is very important, so should think carefully.
                  [news.toString(), error.peekContent()?.type]));

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Loading();
              }

              if (!homeViewModel.hasArticle) {
                return const Text('Empty screen');
              }

              return ListView.builder(
                itemCount: news.articles.length,
                itemBuilder: (_, index) {
                  return ArticleItem(article: news.articles[index]);
                },
              );
            },
          ),
        ));
  }
}
