import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/article.dart';
import '../component/network_image.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Article article = Get.arguments;

    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: article.url!,
            child: networkImage(article.urlToImage),
          ),
        ),
        onTap: Get.back,
      ),
    );
  }
}
