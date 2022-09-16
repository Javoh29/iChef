import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_decorations.dart';
import '../../../../config/constants/app_text_styles.dart';
import '../../../../config/constants/assets.dart';

class ProductSubsComponent extends StatelessWidget {
  const ProductSubsComponent({Key? key, required this.onTap}) : super(key: key);
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onTap,
      icon: SvgPicture.asset(Assets.icons.subscribe),
      label: Text(
        "Подписаться",
        style: AppTextStyles.b4Medium.copyWith(
          color: AppColors.baseLight.shade100,
        ),
      ),
      style: AppDecorations.buttonStyle(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
      ),
    );
  }
}
