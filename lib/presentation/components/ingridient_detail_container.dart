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
    Widget addInfoWidget = addInfo.isEmpty
        ? const SizedBox()
        : Text(
            addInfo,
            style: AppTextStyles.b4Medium.copyWith(
              color: AppColors.metalColor.shade50,
            ),
          );

    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 10,
      ),
      decoration: AppDecorations.defDecor.copyWith(
        color: isActive
            ? AppColors.primaryLight.shade50
            : AppColors.metalColor.shade10,
      ),
      child: Row(
        children: [
          Checkbox(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            value: isActive,
            onChanged: (value) {},
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 12,
                ),
                decoration: AppDecorations.defDecor.copyWith(
                  color: Colors.transparent,
                  border: Border.all(
                    color: AppColors.primaryLight,
                  ),
                ),
                child: Text(
                  title,
                  style: AppTextStyles.b4Medium.copyWith(
                    color: AppColors.primaryLight.shade100,
                  ),
                ),
              ),
              addInfoWidget,
            ],
          ),
          const Spacer(),
          Text(
            data,
            style: AppTextStyles.b5DemiBold,
          ),
        ],
      ),
    );
  }
}
