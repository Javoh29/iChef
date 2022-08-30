import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_decorations.dart';
import '../../../../config/constants/app_text_styles.dart';
import '../../../../config/constants/assets.dart';

class ProductBuyComponent extends StatelessWidget {
  const ProductBuyComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: SvgPicture.asset(Assets.icons.basket),
      label: Text(
        "В список покупок",
        style: AppTextStyles.b4Medium.copyWith(
          color: AppColors.primaryLight,
        ),
      ),
      style: AppDecorations.buttonStyle(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 12,
        ),
        bgColor: AppColors.baseLight.shade100,
        border: BorderSide(
          color: AppColors.primaryLight,
          width: 1,
        ),
      ),
    );
  }
}
