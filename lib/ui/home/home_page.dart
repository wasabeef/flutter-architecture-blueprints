import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants.dart';
import '../../util/error_snackbar.dart';
import '../../util/ext/async_snapshot.dart';
import '../app_theme.dart';
import '../component/article_item.dart';
import '../component/container_with_loading.dart';
import '../component/image.dart';
import '../loading_state_view_model.dart';
import '../user_view_model.dart';
import 'home_view_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(L10n.of(context)!.home,
              style: Theme.of(context).textTheme.headline1),
          actions: [
            // action button
            IconButton(
              icon: const Icon(Icons.color_lens),
              onPressed: () async => context
                  .read(appThemeNotifierProvider)
                  .toggle()
                  .catchError((error) {
                showErrorSnackbar(L10n.of(context)!.error,
                    L10n.of(context)!.failedSwitchTheme);
              }),
            ),
            IconButton(
                icon: HookBuilder(builder: (context) {
                  final user = useProvider(
                      userViewModelProvider.select((value) => value.user));
                  return CircleAvatar(
                    backgroundImage: loadProfileImage(user?.photoURL),
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
