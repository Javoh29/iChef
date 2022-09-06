import 'package:flutter/material.dart';
import 'package:ichef/presentation/components/custom_badge.dart';

import '../../config/constants/app_colors.dart';

class GradientAvatarWidget extends StatelessWidget {
  const GradientAvatarWidget({
    Key? key,
    required this.avatarPath,
    required this.size,
    required this.colors,
    required this.borderRadius,
    this.margin,
    this.badgeText,
  }) : super(key: key);
  final List<Color> colors;
  final Widget avatarPath;
  final double size;
  final double borderRadius;
  final EdgeInsets? margin;
  final String? badgeText;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: size,
        height: size,
        padding: const EdgeInsets.all(2),
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            colors: colors,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(borderRadius - 2), color: AppColors.baseLight.shade100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(size / 2),
            child: avatarPath,
          ),
        ),
      ),
      Positioned(
        top: 5,
        right: 10,
        child: badgeText != null
            ? CustomBadge(
                text: badgeText ?? '',
                isActive: false,
              )
            : const SizedBox.shrink(),
      ),
    ]);
  }
}
