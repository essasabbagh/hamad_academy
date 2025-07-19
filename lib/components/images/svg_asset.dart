import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class SvgAsset extends StatelessWidget {
  const SvgAsset(
    this.assetName, {
    super.key,
    this.width,
    this.height,
<<<<<<< HEAD
    this.color,
=======
    required this.color,
>>>>>>> 3ecac7f (first commit)
  });

  final String assetName;
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      width: width,
      height: height,
      colorFilter: color == null
          ? null
          : ColorFilter.mode(color!, BlendMode.srcIn),
    );
  }
}
