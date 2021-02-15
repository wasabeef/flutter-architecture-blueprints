import 'package:flutter/widgets.dart';

import '../../gen/assets.gen.dart';

Widget networkImage(String url, {BoxFit fit}) {
  final placeholder = Assets.images.articlePlaceholder.image(fit: fit);

  if (url == null) {
    return placeholder;
  } else {
    return Image.network(
      url,
      fit: fit,
      errorBuilder: (context, url, dynamic error) => placeholder,
    );
  }
}
