import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ichef/presentation/widgets/scale_widget.dart';

import '../../config/constants/app_colors.dart';

class SvgCircleButton extends StatelessWidget {
  const SvgCircleButton(
      {Key? key,
      required this.size,
      required this.mOnTap,
      required this.icon,
      this.bgColor,
      this.iconSize,
      this.iconColor})
      : super(key: key);

  final Function() mOnTap;
  final double size;
  final double? iconSize;
  final Color? bgColor;
  final String icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return ScaleWidget(
      mOnTap: mOnTap,
      scale: .7,
      child: Container(
        height: size,
        width: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: bgColor ?? AppColors.baseLight.shade100,
          boxShadow: [
            BoxShadow(
              color: AppColors.metalColor.shade100.withOpacity(.12),
              blurRadius: 10,
              offset: const Offset(0, 15),
            ),
          ],
        ),
        child: SvgPicture.asset(
          icon,
          height: iconSize ?? 16,
          width: iconSize ?? 16,
          color: iconColor,
        ),
      ),
    );
  }
}
