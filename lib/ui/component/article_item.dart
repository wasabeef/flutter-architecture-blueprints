import 'package:app/constants.dart';
import 'package:app/data/model/article.dart';
import 'package:app/util/ext/context.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({@required Article article}) : _article = article;

  final Article _article;

  static BorderRadius borderRadiusAll = BorderRadius.circular(8.0);
  static BorderRadius borderRadiusTop = const BorderRadius.only(
    topRight: Radius.circular(8.0),
    topLeft: Radius.circular(8.0),
    bottomLeft: Radius.circular(0.0),
    bottomRight: Radius.circular(0.0),
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: borderRadiusAll),
      elevation: 4,
      child: GestureDetector(
        child: Column(
          children: <Widget>[
            Hero(
              tag: _article.url,
              child: SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: borderRadiusTop,
                    child: _article.urlToImage == null
                        ? Image.asset(
                            'assets/images/article_placeholder.webp',
                            fit: BoxFit.cover,
                          )
                        : CachedNetworkImage(
                            imageUrl: _article.urlToImage,
                            fit: BoxFit.cover,
                            errorWidget: (context, url, dynamic error) =>
                                Image.asset(
                                    'assets/images/article_placeholder.webp',
                                    fit: BoxFit.cover),
                          ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _article.title,
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
        onTap: () => context.navigator.pushNamed(
          Constants.PAGE_DETAIL,
          arguments: _article,
        ),
      ),
    );
  }
}
