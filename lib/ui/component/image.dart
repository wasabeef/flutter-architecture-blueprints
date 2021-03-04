import 'package:flutter/widgets.dart';

import '../../gen/assets.gen.dart';

ImageProvider loadProfileImage(String? imageUrl) {
  return imageUrl == null || imageUrl.isEmpty
      ? Assets.images.iconPlaceholder
      : Image.network(imageUrl) as ImageProvider<Object>;
}
