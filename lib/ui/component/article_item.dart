import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../data/model/article.dart';
import 'network_image.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem(this._article);

  final Article _article;

  static BorderRadius borderRadiusAll = BorderRadius.circular(8);
  static BorderRadius borderRadiusTop = const BorderRadius.only(
    topRight: Radius.circular(8),
    topLeft: Radius.circular(8),
    bottomLeft: Radius.circular(0),
    bottomRight: Radius.circular(0),
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
              tag: _article.url!,
              child: SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: borderRadiusTop,
                    child: networkImage(_article.urlToImage, fit: BoxFit.cover),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                _article.title ?? 'No Title',
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
        onTap: () => Get.toNamed(Constants.pageDetail, arguments: _article),
      ),
    );
  }
}
