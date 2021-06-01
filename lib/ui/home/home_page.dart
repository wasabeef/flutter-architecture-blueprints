import 'package:app/constants.dart';
import 'package:app/ui/app_theme.dart';
import 'package:app/ui/component/article_item.dart';
import 'package:app/ui/component/container_with_loading.dart';
import 'package:app/ui/component/image.dart';
import 'package:app/ui/home/home_view_model.dart';
import 'package:app/ui/hook/use_l10n.dart';
import 'package:app/ui/hook/use_theme.dart';
import 'package:app/ui/loading_state_view_model.dart';
import 'package:app/ui/user_view_model.dart';
import 'package:app/util/error_snackbar.dart';
import 'package:app/util/ext/async_snapshot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final theme = useTheme();
    final l10n = useL10n();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            l10n.home,
            style: theme.textTheme.headline1,
          ),
          actions: [
            // action button
            IconButton(
              icon: const Icon(Icons.color_lens),
              onPressed: () async => context
                  .read(appThemeNotifierProvider)
                  .toggle()
                  .catchError((error) {
                showErrorSnackbar(
                  l10n.error,
                  l10n.failedSwitchTheme,
                );
              }),
            ),
            IconButton(
                icon: HookBuilder(builder: (context) {
                  final user = useProvider(
                      userViewModelProvider.select((value) => value.user));
                  return CircleAvatar(
                    backgroundImage: profileImageProvider(user?.photoURL),
                    backgroundColor: Colors.transparent,
                    radius: 12,
                  );
                }),
                onPressed: () => Get.toNamed(Constants.pageSignIn))
          ],
        ),
        body: ContainerWithLoading(
          child: HookBuilder(
            builder: (context) {
              final homeViewModel = context.read(homeViewModelProvider);
              final news = useProvider(
                  homeViewModelProvider.select((value) => value.news));
              final snapshot = useFuture(
                  useMemoized(() {
                    return context
                        .read(loadingStateProvider)
                        .whileLoading(homeViewModel.fetchNews);
                  }, [news?.toString()]),
                  initialData: null);

              // Not yet load the contents.
              if (!snapshot.isDone || news == null) return Container();

              return news.when(success: (data) {
                if (data.articles.isEmpty) {
                  return const Text('Empty screen');
                }
                return RefreshIndicator(
                  onRefresh: () async => homeViewModel.fetchNews(),
                  child: ListView.builder(
                    itemCount: data.articles.length,
                    itemBuilder: (_, index) {
                      return ArticleItem(data.articles[index]);
                    },
                  ),
                );
              }, failure: (e) {
                return Text('Error Screen: $e');
              });
            },
          ),
        ));
  }
}
