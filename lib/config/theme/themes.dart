import 'package:flutter/material.dart';
import 'package:ichef/config/constants/app_colors.dart';

import '../constants/app_text_styles.dart';

abstract class Themes {
  const Themes._();
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.green,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.baseLight.shade100,
      colorScheme: ColorScheme.light(
        secondary: AppColors.primaryLight.shade100,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.baseLight.shade100,
        centerTitle: true,
        titleTextStyle: AppTextStyles.b1Medium.copyWith(color: AppColors.metalColor.shade100),
        iconTheme: IconThemeData(
          color: AppColors.metalColor.shade100,
        ),
      ),
      dividerColor: Colors.transparent,
      tabBarTheme: TabBarTheme(
        indicator: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.primaryLight.shade100,
            ),
          ),
        ),
        labelPadding: const EdgeInsets.all(12.0),
        labelColor: AppColors.primaryLight.shade100,
        labelStyle: AppTextStyles.b3Medium,
        unselectedLabelColor: AppColors.metalColor.shade50,
        unselectedLabelStyle: AppTextStyles.b3Medium,
      ),
    );
  }
}
