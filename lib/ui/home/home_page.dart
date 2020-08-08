import 'package:app/data/model/news.dart';
import 'package:app/ui/app_theme.dart';
import 'package:app/ui/component/loading.dart';
import 'package:app/ui/home/home_view_model.dart';
import 'package:app/util/ext/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final homeViewModel = useProvider(homeViewModelNotifierProvider);
    final future = useMemoized(() => homeViewModel.getNews());
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
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Fetch latest news from newsapi.org:',
            ),
            FutureBuilder<News>(
              future: future,
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    'Total results: ${snapshot.data.totalResults}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else {
                  return const Loading();
                }
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await homeViewModel.getNews(),
        tooltip: 'Reload',
        child: const Icon(Icons.book),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
