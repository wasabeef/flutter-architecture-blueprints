import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/article.dart';
import '../../gen/assets.gen.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Article _article = Get.arguments;

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
        onTap: Get.back,
      ),
    );
  }
}
