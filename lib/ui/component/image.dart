import 'package:flutter/widgets.dart';

import '../../gen/assets.gen.dart';

Image loadProfileImage(String? imageUrl) {
  if (imageUrl == null || imageUrl.isEmpty) {
    return Assets.images.iconPlaceholder.image();
  }
  return Image.network(imageUrl);
}

ImageProvider loadProfileImageProvider(String? imageUrl) {
  if (imageUrl == null || imageUrl.isEmpty) {
    return Assets.images.iconPlaceholder;
  }
  return NetworkImage(imageUrl);
}
