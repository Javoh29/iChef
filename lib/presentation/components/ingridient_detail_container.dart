import 'package:flutter/material.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_decorations.dart';
import '../../config/constants/app_text_styles.dart';

class IngridientDetailContainer extends StatelessWidget {
  const IngridientDetailContainer({
    required this.title,
    required this.addInfo,
    required this.data,
    required this.data2,
    Key? key,
  }) : super(key: key);

  final String title;
  final String addInfo;
  final String data;
  final String data2;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: AppColors.metalColor.shade10,
      contentPadding: const EdgeInsets.symmetric(horizontal: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      title: Wrap(
        children: [
          TextButton(
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
        ],
      ),
      subtitle: addInfo.isNotEmpty
          ? Text(
              addInfo,
              style: AppTextStyles.b4Medium.copyWith(
                color: AppColors.metalColor.shade50,
              ),
            )
          : null,
      trailing: RichText(
        textAlign: TextAlign.right,
        text: TextSpan(
          text: data,
          style: AppTextStyles.b5DemiBold,
          children: [
            TextSpan(
              text: "\n$data2",
              style: AppTextStyles.b4Regular,
            ),
          ],
        ),
      ),
    );
  }
}
