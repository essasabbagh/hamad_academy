import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:hamad/core/constants/images.dart';
import 'package:hamad/core/extensions/context_ext.dart';

class ReminderCard extends StatelessWidget {
  const ReminderCard({
    super.key,
    required this.title,
    required this.cta,
    required this.bgColor,
    required this.textColor,
  });
  final String title;
  final String cta;
  final Color bgColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width - 32,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                AppImages.iconsAlert,
                colorFilter: ColorFilter.mode(
                  textColor,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    color: textColor,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          const Spacer(),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              cta,
              style: TextStyle(
                fontSize: 16,
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
