import 'package:app/ui/home/home_view_model.dart';
import 'package:app/util/ext/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final news = useProvider(
        homeViewModelNotifierProvider.select((value) => value.news));
    final homeViewModel = useProvider(homeViewModelNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localized.home),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Fetch latest news from newsapi.org:',
            ),
            Text(
              news.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await homeViewModel.getNews(),
        tooltip: 'Get News',
        child: const Icon(Icons.book),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
