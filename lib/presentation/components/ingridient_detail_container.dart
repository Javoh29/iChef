import 'package:flutter/material.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_decorations.dart';
import '../../config/constants/app_text_styles.dart';

class IngridientDetailContainer extends StatelessWidget {
  const IngridientDetailContainer({
    required this.isActive,
    required this.title,
    required this.addInfo,
    required this.data,
    Key? key,
  }) : super(key: key);

  final bool isActive;
  final String title;
  final String addInfo;
  final String data;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: isActive,
      tileColor: isActive ? AppColors.primaryLight.shade50 : AppColors.metalColor.shade10,
      contentPadding: const EdgeInsets.symmetric(horizontal: 5),
      side: BorderSide(color: AppColors.metalColor.shade30, width: 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      checkboxShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      title: TextButton(
        onPressed: () {},
        style: AppDecorations.buttonStyle(
          bgColor: AppColors.primaryLight.shade50,
          border: BorderSide(color: AppColors.primaryLight.shade100, width: 1),
        ),
        child: Text(
          title,
          style: AppTextStyles.b4Medium.copyWith(
            color: AppColors.primaryLight.shade100,
          ),
        ),
      ),
      subtitle: addInfo.isNotEmpty
          ? Text(
              addInfo,
              style: AppTextStyles.b4Medium.copyWith(
                color: AppColors.metalColor.shade50,
              ),
            )
          : null,
      secondary: Text(
        data,
        style: AppTextStyles.b5DemiBold,
      ),
      onChanged: (value) {},
    );
  }
}
