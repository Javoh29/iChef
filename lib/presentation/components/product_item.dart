import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_decorations.dart';
import '../../config/constants/app_text_styles.dart';
import '../../config/constants/assets.dart';

// ignore: must_be_immutable
class ProductItem extends StatelessWidget {
  ProductItem({required this.title, Key? key}) : super(key: key);
  String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: AppDecorations.buttonStyle(
        bgColor: AppColors.primaryLight.shade50,
        border: BorderSide(
          color: AppColors.primaryLight.shade100,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: AppTextStyles.b4Medium.copyWith(
              color: AppColors.primaryLight.shade100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: SvgPicture.asset(Assets.icons.delete),
          )
        ],
      ),
    );
  }
}
