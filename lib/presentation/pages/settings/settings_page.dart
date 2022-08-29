import 'package:flutter/material.dart';
import 'package:ichef/config/constants/app_colors.dart';
import 'package:ichef/config/constants/app_decorations.dart';
import 'package:ichef/config/constants/app_text_styles.dart';
import 'package:ichef/presentation/routes/routes.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () => Navigator.pushNamed(context, Routes.userPrefrencesPage),
          style: AppDecorations.buttonStyle(),
          child: Text(
            'User Prefrences',
            style: AppTextStyles.h5.copyWith(color: AppColors.baseLight.shade100),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, Routes.generationMenuPage),
          style: AppDecorations.buttonStyle(),
          child: Text(
            'Generation Menu',
            style: AppTextStyles.h5.copyWith(color: AppColors.baseLight.shade100),
          ),
        ),  const SizedBox(
          height: 10,
        ),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, Routes.shoppingListPage),
          style: AppDecorations.buttonStyle(),
          child: Text(
            'Shopping List Page',
            style: AppTextStyles.h5.copyWith(color: AppColors.baseLight.shade100),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, Routes.dishReplaceMentPage),
          style: AppDecorations.buttonStyle(),
          child: Text(
            'Dish Replacement',
            style: AppTextStyles.h5.copyWith(color: AppColors.baseLight.shade100),
          ),
        ),
      ],
    );
  }
}
