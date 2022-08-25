import 'package:flutter/material.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_decorations.dart';
import '../../config/constants/app_text_styles.dart';

class CustomBadge extends StatelessWidget {
  const CustomBadge({
    required this.text,
    this.isActive = true,
    Key? key,
  }) : super(key: key);
  final String text;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      margin: const EdgeInsets.symmetric(horizontal: 3),
      decoration: AppDecorations.defDecor.copyWith(color: isActive ? AppColors.primaryLight : null),
      child: Text(text,
          style: AppTextStyles.b4Medium.copyWith(
            color: isActive ? AppColors.baseLight.shade100 : AppColors.metalColor,
          )),
    );
  }
}
