import 'package:flutter/material.dart';

import 'package:hamad/core/helpers/image_helper.dart';

/// ```dart
/// AvatarWidget(
///  imageUrl: 'https://example.com/avatar.png',
///  size: 80.0, // Customize the size if needed
/// )
/// ```
class AvatarWidget extends StatelessWidget {
  const AvatarWidget(this.imageUrl, {super.key, this.size = 50.0});
  final String imageUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size / 2,
      // backgroundImage: NetworkImage(imageUrl),
      backgroundImage: ImageHelper.cashedImageProvider(imageUrl),
    );
  }
}
