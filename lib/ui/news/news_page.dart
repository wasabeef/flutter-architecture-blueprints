import 'package:app/foundation/extension/async_snapshot.dart';
import 'package:app/ui/component/loading/container_with_loading.dart';
import 'package:app/ui/hook/use_l10n.dart';
import 'package:app/ui/loading_state_view_model.dart';
import 'package:app/ui/news/article_item.dart';
import 'package:app/ui/news/news_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewsPage extends HookConsumerWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final homeViewModel = ref.read(newsViewModelProvider);
    final news = ref.watch(newsViewModelProvider.select((value) => value.news));

    final snapshot = useFuture(
      useMemoized(() {
        return ref
            .read(loadingStateProvider)
            .whileLoading(homeViewModel.fetchNews);
      }),
    );

    return ContainerWithLoading(
      child: snapshot.isWaiting || news == null
          ? const SizedBox()
          : news.when(success: (data) {
              if (data.articles.isEmpty) {
                return Center(child: Text(l10n.noResult));
              }
              return RefreshIndicator(
                onRefresh: () async => homeViewModel.fetchNews(),
                child: ListView.builder(
                  itemCount: data.articles.length,
                  itemBuilder: (_, index) {
                    return ArticleItem(article: data.articles[index]);
                  },
                ),
              );
            }, failure: (e) {
              return Center(child: Text(l10n.fetchFailed));
            }),
    );
  }
}
