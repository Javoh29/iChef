import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ichef/config/constants/app_colors.dart';
import 'package:ichef/presentation/components/blured_panel.dart';
import 'package:ichef/presentation/components/recipe_item.dart';
import 'package:ichef/presentation/routes/routes.dart';

import '../../../../config/constants/app_text_styles.dart';
import '../../../../config/constants/assets.dart';
import '../../../../config/constants/local_data.dart';
import 'food_composition.dart';

class CalendarTabPage extends StatelessWidget {
  const CalendarTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: const [
        FoodComposition(),
        CalendarSubtitleWidget(title: 'Завтрак', kKal: '246'),
        ...[CalendarTabItems()],
        CalendarSubtitleWidget(title: 'Обед', kKal: '246'),
        ...[CalendarTabItems()],
        CalendarSubtitleWidget(title: 'Ужин', kKal: '246'),
        ...[CalendarTabItems()],
        SizedBox(height: 80)
      ],
    );
  }
}

class CalendarSubtitleWidget extends StatelessWidget {
  const CalendarSubtitleWidget({
    Key? key,
    required this.title,
    required this.kKal,
  }) : super(key: key);
  final String title;
  final String kKal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Text(
            '$title ',
            style: AppTextStyles.h4,
          ),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(Assets.icons.addRounded),
          ),
          const Spacer(),
          Text(
            '$kKal Ккал',
            style: AppTextStyles.b5Regular.copyWith(
              color: AppColors.metalColor.shade50,
            ),
          ),
        ],
      ),
    );
  }
}

class CalendarTabItems extends StatelessWidget {
  const CalendarTabItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 2,
      primary: false,
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            Routes.recipeInfoPage,
            arguments: {
              'recipe_model': listRecipes[index],
              'seek_to_time': const Duration(seconds: 0),
            },
          ),
          child: RecipeItem(
            model: listRecipes[index],
            seekToTime: const Duration(seconds: 0),
            listAdditional: [
              Positioned(
                  top: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BluredPanel(
                        mHeight: 36,
                        mPadding: const EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 10,
                        ),
                        mBorderRadius: 12,
                        widget: Row(
                          children: const [
                            FoodComText(count: '56', type: 'Б'),
                            FoodComText(count: '63', type: 'Ж'),
                            FoodComText(count: '56', type: 'У'),
                            FoodComText(count: '343', type: 'Ккал'),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context, Routes.recipeReplacePage),
                        child: BluredPanel(
                            mHeight: 36,
                            mPadding: const EdgeInsets.symmetric(
                                horizontal: 9, vertical: 10),
                            mBorderRadius: 12,
                            widget: Text(
                              'Заменить',
                              style: AppTextStyles.b4Medium.copyWith(
                                  color: AppColors.baseLight.shade100),
                            )),
                      ),
                    ],
                  ))
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
    );
  }
}

class FoodComText extends StatelessWidget {
  const FoodComText({
    Key? key,
    required this.count,
    required this.type,
  }) : super(key: key);

  final String count;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: RichText(
        text: TextSpan(
          text: count,
          style: AppTextStyles.b4Medium
              .copyWith(color: AppColors.baseLight.shade100),
          children: [
            TextSpan(
              text: ' $type',
              style: AppTextStyles.b4Medium.copyWith(
                color: AppColors.baseLight.shade40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
