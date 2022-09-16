import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_decorations.dart';
import '../../../../config/constants/app_text_styles.dart';
import '../../../../config/constants/assets.dart';

class OilToFavoriteComponent extends StatelessWidget {
  const OilToFavoriteComponent({Key? key, required this.onTap})
      : super(key: key);
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onTap,
      icon: SvgPicture.asset(Assets.icons.basket),
      label: Text(
        "В корзину",
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
