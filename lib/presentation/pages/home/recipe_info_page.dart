import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ichef/config/constants/app_decorations.dart';
import 'package:ichef/presentation/components/recipe_item.dart';
import 'package:ichef/presentation/components/recipe_step.dart';
import 'package:ichef/presentation/widgets/drawer_widget.dart';

import '../../../config/constants/app_colors.dart';
import '../../../config/constants/app_text_styles.dart';
import '../../../config/constants/assets.dart';
import '../../../config/constants/local_data.dart';
import '../../../data/models/recipe_model.dart';

class RecipeInfoPage extends StatefulWidget {
  const RecipeInfoPage({required this.model, Key? key}) : super(key: key);
  final RecipeModel model;

  @override
  State<RecipeInfoPage> createState() => _RecipeInfoPageState();
}

class _RecipeInfoPageState extends State<RecipeInfoPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: const IngredientsDrawer(),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          itemRecipe(widget.model),
          // #additional info
          Container(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Column(
              children: [
                // #additional info icons
                Row(
                  children: [
                    ...infoIcons
                        .map(
                          (item) => itemIconCtg(item),
                        )
                        .toList(),
                    itemIconCtg(Assets.icons.moreOne),
                  ],
                ),
                // #recipe types
                Container(
                  height: 40,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: recipeTypes
                        .map(
                          (item) => Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: recipeTypeButton(item),
                          ),
                        )
                        .toList(),
                  ),
                ),
                // #recipe path
                Row(
                  children: [
                    Text(
                      'Десерты',
                      style: AppTextStyles.h5,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                      ),
                    ),
                    Text(
                      'Выпечка',
                      style: AppTextStyles.h5,
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                // #recipe info
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    recipeText,
                    style: AppTextStyles.h5.copyWith(color: AppColors.metalColor.shade70),
                  ),
                ),
              ],
            ),
          ),
          // Recipe prepairing steps
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: List.generate(recipeSteps.length, ((index) {
                return RecipeStep(
                    size: size,
                    stepNumber: recipeSteps[index]['stepNumber'],
                    stepName: recipeSteps[index]['stepName'],
                    stepContext: recipeSteps[index]['stepContext']);
              })),
            ),
          ),
        ],
      ),
    );
  }

  Container itemIconCtg(String item) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Image.asset(
        item,
        width: 40,
        height: 40,
      ),
    );
  }

  //#recipe type button
  Widget recipeTypeButton(String recipeType) {
    return TextButton(
      onPressed: () {},
      style: AppDecorations.buttonStyle(
        bgColor: AppColors.primaryLight.shade50,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        borderRadius: 12,
        border: BorderSide(color: AppColors.primaryLight.shade100, width: 1),
      ),
      child: Text(
        recipeType,
        style: AppTextStyles.b4Medium.copyWith(color: AppColors.baseLight),
      ),
    );
  }

  //#recipe item
  Widget itemRecipe(RecipeModel model) {
    return RecipeItem(
      model: model,
      borderRadius: 0,
      listAdditional: [
        Positioned(
          top: 10,
          left: 0,
          right: 0,
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // #back button
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: SvgPicture.asset(Assets.icons.backArrow),
                ),
                // #time and views
                Container(
                  height: 28,
                  decoration: AppDecorations.defDecor.copyWith(
                    color: AppColors.metalColor.shade70.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: AppColors.baseLight.shade20, width: 1.5),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              Assets.icons.recipeTime,
                              width: 16,
                              height: 16,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                widget.model.recipeTime ?? '',
                                style: AppTextStyles.h6,
                              ),
                            ),
                            VerticalDivider(
                              indent: 6,
                              endIndent: 6,
                              width: 1.5,
                              thickness: 1.5,
                              color: AppColors.baseLight.shade100,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: SvgPicture.asset(
                                Assets.icons.recipeView,
                                width: 16,
                                height: 16,
                              ),
                            ),
                            Text(
                              widget.model.recipeView ?? '',
                              style: AppTextStyles.h6,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // #search button
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(Assets.icons.search),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          right: 20,
          child: TextButton.icon(
            onPressed: () {},
            style: AppDecorations.buttonStyle(
              padding: const EdgeInsets.symmetric(horizontal: 12),
            ).copyWith(
              overlayColor: MaterialStateProperty.all(AppColors.baseLight.shade40),
            ),
            icon: Text(
              'Начать готовить',
              style: AppTextStyles.b3Medium.copyWith(color: AppColors.baseLight.shade100),
            ),
            label: Icon(
              Icons.arrow_forward_ios,
              color: AppColors.baseLight.shade100,
              size: 16,
            ),
          ),
        ),
      ],
    );
  }
}
