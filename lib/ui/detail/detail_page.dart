import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/article.dart';
import '../component/image.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Article article = Get.arguments;

    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: article,
            child: networkImage(article.urlToImage),
          ),
        ),
        onTap: Get.back,
      ),
    );
  }
}
