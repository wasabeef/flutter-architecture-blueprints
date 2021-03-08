import 'package:flutter/widgets.dart';

import '../../gen/assets.gen.dart';

Image profileImage(String? imageUrl) {
  if (imageUrl == null || imageUrl.isEmpty) {
    return Assets.images.iconPlaceholder.image();
  }
  return Image.network(imageUrl);
}

ImageProvider profileImageProvider(String? imageUrl) {
  if (imageUrl == null || imageUrl.isEmpty) {
    return Assets.images.iconPlaceholder;
  }
  return NetworkImage(imageUrl);
}

Image networkImage(String? url, {BoxFit? fit}) {
  final placeholder = Assets.images.articlePlaceholder.image(fit: fit);
  if (url == null || url.isEmpty) {
    return placeholder;
  }
  return Image.network(
    url,
    fit: fit,
    errorBuilder: (context, url, dynamic error) => placeholder,
  );
}
