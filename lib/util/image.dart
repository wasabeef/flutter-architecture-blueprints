import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';

Widget networkImage(String url, {BoxFit fit}) {
  final placeholder =
      Image.asset('assets/images/article_placeholder.webp', fit: fit);

  if (url == null) {
    return placeholder;
  } else {
    return CachedNetworkImage(
      imageUrl: url,
      fit: fit,
      errorWidget: (context, url, dynamic error) => placeholder,
    );
  }
}
