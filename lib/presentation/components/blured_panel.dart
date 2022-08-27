import 'dart:ui';

import 'package:flutter/material.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_decorations.dart';

class BluredPanel extends StatelessWidget {
  const BluredPanel(
      {Key? key,
      required this.widget,
      required this.mHeight,
      required this.mPadding,
      required this.mBorderRadius,
      this.mMargin})
      : super(key: key);
  final Widget widget;
  final double mHeight;
  final EdgeInsets mPadding;
  final EdgeInsets? mMargin;
  final double mBorderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mHeight,
      margin: mMargin,
      decoration: AppDecorations.defDecor.copyWith(
        color: AppColors.metalColor.shade70.withOpacity(0.5),
        borderRadius: BorderRadius.circular(mBorderRadius),
        border: Border.all(color: AppColors.baseLight.shade20, width: 1.5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(mBorderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Padding(
            padding: mPadding,
            child: widget,
          ),
        ),
      ),
    );
  }
}
