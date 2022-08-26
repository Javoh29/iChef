import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_decorations.dart';
import '../../config/constants/app_text_styles.dart';

class IconButtonAction extends StatelessWidget {
  const IconButtonAction({
    required this.onTap,
    required this.icon,
    this.lable,
    this.isActive = false,
    this.height,
    this.textStyle,
    this.borderRadius,
    Key? key,
  }) : super(key: key);
  final Function onTap;
  final String? lable;
  final String icon;
  final bool isActive;
  final double? height;
  final TextStyle? textStyle;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 28,
      child: lable == null
          ? IconButton(
              onPressed: () => onTap(),
              icon: SvgPicture.asset(
                icon,
                height: 16,
                width: 16,
              ),
              padding: EdgeInsets.zero,
            )
          : TextButton.icon(
              onPressed: () => onTap(),
              icon: SvgPicture.asset(
                icon,
                height: 16,
                width: 16,
              ),
              label: Text(
                lable!,
                style: textStyle ?? AppTextStyles.b5Regular,
              ),
              style: AppDecorations.buttonStyle(
                  bgColor: isActive ? AppColors.metalColor.shade10 : Colors.transparent,
                  borderRadius: borderRadius ?? 20,
                  padding: EdgeInsets.zero),
            ),
    );
  }
}
