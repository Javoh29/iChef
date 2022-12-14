import 'package:flutter/material.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_decorations.dart';
import '../../config/constants/app_text_styles.dart';

// ignore: must_be_immutable
class PrefrencesProductsContainer extends StatelessWidget {
  PrefrencesProductsContainer({this.elements, this.title, Key? key}) : super(key: key);
  List<Widget>? elements;
  String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(10),
      decoration: AppDecorations.defDecor,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: title != null ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
            children: [
              Text(
                title ?? '',
                style: AppTextStyles.b4DemiBold.copyWith(
                  color: AppColors.primaryLight.shade100,
                ),
              ),
              Container(
                height: 24,
                width: 24,
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 8,
                ),
                decoration: AppDecorations.defDecor.copyWith(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "+",
                  style: AppTextStyles.b4Medium.copyWith(
                    color: AppColors.baseLight.shade100,
                  ),
                ),
              ),
            ],
          ),
          Wrap(
            spacing: 10,
            children: elements!,
          )
        ],
      ),
    );
  }
}
