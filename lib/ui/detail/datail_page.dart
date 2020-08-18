import 'package:app/data/model/article.dart';
import 'package:app/util/ext/context.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
                : CachedNetworkImage(
                    imageUrl: _article.urlToImage,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, dynamic error) => Image.asset(
                        'assets/images/article_placeholder.webp',
                        fit: BoxFit.cover),
                  ),
          ),
        ),
        onTap: () => context.navigator.pop(),
      ),
    );
  }
}
