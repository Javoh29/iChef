import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ichef/presentation/pages/product/components/product_composition.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_decorations.dart';
import '../../../../config/constants/app_text_styles.dart';
import '../../../../config/constants/assets.dart';

class ProductCompositionsContainer extends StatelessWidget {
  const ProductCompositionsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: AppDecorations.defDecor.copyWith(
        color: Colors.transparent,
        border: Border.all(
          color: AppColors.metalColor.shade30,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              text: "12226",
              style: AppTextStyles.b4DemiBold,
              children: [
                TextSpan(
                  text: " Ккал на 100 г\n\n",
                  style: AppTextStyles.b5Regular.copyWith(
                    color: AppColors.metalColor.shade50,
                  ),
                ),
                productComposition(56, "Белки"),
                productComposition(62, "Жиры"),
                productComposition(56, "Углеводы"),
              ],
            ),
          ),
          CircleAvatar(
            radius: 15,
            child: Center(
              child: InkWell(
                onTap: () {},
                child: Transform.rotate(
                  angle: 3.14,
                  child: SvgPicture.asset(
                    Assets.icons.backArrow,
                    height: 15,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
