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
    final error = useProvider(errorNotifierProvider);
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
              final homeViewModel = useProvider(homeViewModelNotifierProvider);
              final snapshot = useFuture(useMemoized(
                  () => homeViewModel.fetchNews(),
                  // These Keys is very important, so should think carefully.
                  [homeViewModel.news.toString(), error.peekContent()?.type]));

              return snapshot.connectionState == ConnectionState.waiting
                  ? const Loading()
                  : ListView.builder(
                      itemCount: homeViewModel.news.articles.length,
                      itemBuilder: (_, index) {
                        return ArticleItem(
                            article: homeViewModel.news.articles[index]);
                      },
                    );
            },
          ),
        ));
  }
}
