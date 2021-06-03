import 'package:app/data/model/article.dart';
import 'package:app/ui/component/image.dart';
import 'package:app/ui/hook/use_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DetailPage extends HookWidget {
  const DetailPage({
    // TODO: QueryParams must be nullable or have default value
    @QueryParam('article') this.article,
  });

  final Article? article;

  @override
  Widget build(BuildContext context) {
    assert(article != null, "Article is required.");
    final router = useRouter();
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: article!,
            child: networkImage(article?.urlToImage),
          ),
        ),
        onTap: router.pop,
      ),
    );
  }
}
