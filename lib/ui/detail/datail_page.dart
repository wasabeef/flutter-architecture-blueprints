import 'package:flutter/material.dart';

import '../../data/model/article.dart';
import '../../gen/assets.gen.dart';
import '../../util/ext/context.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _article = context.args<Article>();

    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: _article.url,
            child: _article.urlToImage == null
                ? Assets.images.articlePlaceholder.image()
                : Image.network(
                    _article.urlToImage,
                  ),
          ),
        ),
        onTap: () => context.navigator.pop(),
      ),
    );
  }
}
