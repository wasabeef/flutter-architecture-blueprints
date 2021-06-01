import 'package:app/data/model/article.dart';
import 'package:app/ui/component/image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
