import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_decorations.dart';
import '../../../../config/constants/app_text_styles.dart';
import '../../../../config/constants/assets.dart';

// ignore: must_be_immutable
class DiscountContainer extends StatelessWidget {
  DiscountContainer({
    required this.imagePath,
    required this.name,
    required this.originalPrice,
    required this.discountPrice,
    Key? key,
  }) : super(key: key);
  String imagePath;
  String name;
  String originalPrice;
  String discountPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(10),
      decoration: AppDecorations.defDecor.copyWith(
        color: AppColors.baseLight.shade100,
        border: Border.all(
          color: AppColors.metalColor.shade30,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            scale: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    name,
                    style: AppTextStyles.b4Regular,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      originalPrice,
                      style: AppTextStyles.b4Regular.copyWith(
                        color: AppColors.metalColor.shade50,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      padding: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 4),
                      decoration: AppDecorations.defDecor.copyWith(
                          color: AppColors.baseLight,
                          borderRadius: BorderRadius.circular(4)),
                      child: Text(
                        "$discountPrice p",
                        style: AppTextStyles.b4Regular.copyWith(
                          color: AppColors.baseLight.shade100,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
