import 'package:app/ui/app_theme.dart';
import 'package:app/ui/component/article_item.dart';
import 'package:app/ui/component/loading.dart';
import 'package:app/ui/component/toast.dart';
import 'package:app/ui/error_notifier.dart';
import 'package:app/ui/home/home_view_model.dart';
import 'package:app/util/ext/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final theme = useProvider(appThemeNotifierProvider);
    final error = useProvider(errorNotifierProvider);
    final homeViewModel = useProvider(homeViewModelNotifierProvider);
    // This is very important, so should think carefully.
    final getNews =
        useMemoized(() => homeViewModel.getNews(), [error.peekContent()?.type]);
    final snapshot = useFuture(getNews);

    if (!error.hasBeenHandled) {
      toast(context, error.getErrorIfNotHandled().message);
    }

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
              onPressed: () async => homeViewModel.getNews(),
            ),
          ],
        ),
        body: Center(
          child: snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.articles.length,
                  itemBuilder: (_, index) {
                    return ArticleItem(article: snapshot.data.articles[index]);
                  },
                )
              : const Loading(),
        ));
  }
}
