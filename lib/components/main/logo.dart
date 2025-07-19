import 'package:flutter/material.dart';

import 'package:hamad/core/constants/images.dart';

class Logo extends StatelessWidget {
  const Logo({super.key, this.width});

  final double? width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.imagesLogo,
      width: width,
    );
  }
}
