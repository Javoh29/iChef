import 'package:flutter/material.dart';
import 'package:ichef/data/models/recipe_model.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_text_styles.dart';
import '../../config/constants/assets.dart';
import 'icon_button_action.dart';

class RecipeItem extends StatelessWidget {
  const RecipeItem({required this.model, this.borderRadius, this.listAdditional, Key? key}) : super(key: key);
  final RecipeModel model;
  final double? borderRadius;
  final List<Widget>? listAdditional;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 17),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(borderRadius ?? 35), topRight: Radius.circular(borderRadius ?? 35)),
                child: Image.asset(
                  model.recipeVideo!,
                  height: 390,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 34,
              width: 34,
              margin: const EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.baseLight.shade100, width: 2),
                image: DecorationImage(
                  image: AssetImage(model.userAvatar!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            if (listAdditional != null) ...listAdditional!
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: RichText(
            text: TextSpan(
              text: model.userName,
              style: AppTextStyles.b4Regular.copyWith(color: AppColors.metalColor.shade100),
              children: [
                TextSpan(
                  text: ' · ',
                  style: AppTextStyles.b4Regular.copyWith(color: AppColors.metalColor.shade50),
                  children: [
                    TextSpan(text: model.categoryName),
                  ],
                ),
                TextSpan(text: '\n${model.recipeName}', style: AppTextStyles.h4)
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
          child: Row(
            children: [
              IconButtonAction(
                onTap: () {},
                icon: Assets.icons.like,
                lable: model.likeCount.toString(),
                isActive: true,
              ),
              IconButtonAction(
                onTap: () {},
                icon: Assets.icons.comment,
                lable: model.likeCount.toString(),
              ),
              IconButtonAction(
                onTap: () {},
                icon: Assets.icons.variation,
                lable: model.likeCount.toString(),
              ),
              IconButtonAction(
                onTap: () {},
                icon: Assets.icons.share,
              ),
              const Spacer(),
              IconButtonAction(
                onTap: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: Assets.icons.ingredients,
                lable: '7',
                height: 32,
                borderRadius: 12,
                isActive: true,
                textStyle: AppTextStyles.b4DemiBold.copyWith(color: AppColors.primaryLight.shade100),
              )
            ],
          ),
        )
      ],
    );
  }
}
