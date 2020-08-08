import 'package:app/data/model/article.dart';
import 'package:app/util/ext/context.dart';
import 'package:flutter/material.dart';

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
                ? Image.asset(
                    'assets/images/article_placeholder.webp',
                  )
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
