import 'package:flutter/material.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_text_styles.dart';

TextSpan productComposition(num value, String name) {
  return TextSpan(
    text: "$value",
    style: AppTextStyles.b5Regular.copyWith(
      color: AppColors.metalColor.shade90,
    ),
    children: [
      TextSpan(
        text: " $name   ",
        style: AppTextStyles.b5Regular.copyWith(
          color: AppColors.metalColor.shade50,
        ),
      ),
    ],
  );
}
