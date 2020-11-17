import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';

import '../../gen/assets.gen.dart';

Widget networkImage(String url, {BoxFit fit}) {
  final placeholder = Assets.images.articlePlaceholder.image(fit: fit);

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
