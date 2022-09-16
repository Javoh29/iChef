import 'package:flutter/material.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_decorations.dart';
import '../../../../config/constants/app_text_styles.dart';

// ignore: must_be_immutable
class BrandAndSalerContainer extends StatelessWidget {
  BrandAndSalerContainer({
    required this.image,
    required this.name,
    required this.price,
    Key? key,
  }) : super(key: key);

  String image;
  String name;
  String price;

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
            image,
            height: 60,
            fit: BoxFit.cover,
            // scale: 2,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 4.5,
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              name,
              style: AppTextStyles.b4Regular,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            "$price p",
            style: AppTextStyles.b4Regular.copyWith(
              color: AppColors.metalColor.shade50,
            ),
          ),
        ],
      ),
    );
  }
}
