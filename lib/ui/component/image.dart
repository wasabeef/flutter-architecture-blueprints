import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';

import '../../gen/assets.gen.dart';

ImageProvider loadProfileImage(String imageUrl) {
  return imageUrl == null || imageUrl.isEmpty
      ? Assets.images.iconPlaceholder
      : CachedNetworkImageProvider(imageUrl);
}
