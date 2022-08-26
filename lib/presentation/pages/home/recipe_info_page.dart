import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ichef/config/constants/app_decorations.dart';
import 'package:ichef/presentation/components/recipe_step.dart';

import '../../../config/constants/app_colors.dart';
import '../../../config/constants/app_text_styles.dart';
import '../../../config/constants/assets.dart';
import '../../../data/models/recipe_model.dart';
import '../../components/icon_button_action.dart';

class RecipeInfoPage extends StatefulWidget {
  const RecipeInfoPage({required this.model, Key? key}) : super(key: key);
  final RecipeModel model;

  @override
  State<RecipeInfoPage> createState() => _RecipeInfoPageState();
}

class _RecipeInfoPageState extends State<RecipeInfoPage> {
  List<String> infoIcons = [
    Assets.icons.pancakeOne,
    Assets.icons.flagOne,
    Assets.icons.stoveOne,
    Assets.icons.bakeryOne,
    Assets.icons.gluttenOne,
    Assets.icons.timeOne,
    Assets.icons.moreOne,
  ];
  List<String> recipeTypes = [
    'Panasonic 1259',
    'Без глютена',
    'Любимый',
    'Любимый',
  ];
  List<String> recipePath = [
    'Десерты',
    'Выпечка',
  ];
  String recipeText =
      "Американский тыквенный пирог с корицей — классика застолья Среднего и прочего Запада, анекдотический персонаж американского быта не лишен, однако, прелести, особенно если не получать его с младых ногтей каждые два дня в качестве десерта. Тыква тоже имеет звание чуть ли не коренного жителя Америки, так как открыта была именно здесь и охотно используется жителями континента во многих блюдах по многим случаям. И все же этот пирог получается безумно вкусным, если выбрать правильную тыкву — удлиненную, с закругленным концом.";

  List<Map> recipeSteps = [
    {
      "stepNumber": "Шаг 1",
      "stepName": "Soften the onion",
      "stepContext":
          "Cut the bell pepper into rings (it is better to choose three different colors - it looks more colorful), after removing the seeds. Cut the onion into half rings, grate the garlic on a fine grater.",
    },
    {
      "stepNumber": "Шаг 2",
      "stepName": "Soften the onion",
      "stepContext":
          "Cut the bell pepper into rings (it is better to choose three different colors - it looks more colorful), after removing the seeds. Cut the onion into half rings, grate the garlic on a fine grater.",
    },
    {
      "stepNumber": "Шаг 3",
      "stepName": "Soften the onion",
      "stepContext":
          "Cut the bell pepper into rings (it is better to choose three different colors - it looks more colorful), after removing the seeds. Cut the onion into half rings, grate the garlic on a fine grater.",
    },
    {
      "stepNumber": "Шаг 4",
      "stepName": "Soften the onion",
      "stepContext":
          "Cut the bell pepper into rings (it is better to choose three different colors - it looks more colorful), after removing the seeds. Cut the onion into half rings, grate the garlic on a fine grater.",
    },
    {
      "stepNumber": "Шаг 5",
      "stepName": "Soften the onion",
      "stepContext":
          "Cut the bell pepper into rings (it is better to choose three different colors - it looks more colorful), after removing the seeds. Cut the onion into half rings, grate the garlic on a fine grater.",
    }
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView(
        children: [
          itemRecipe(widget.model),
          // #additional info
          Container(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Column(
              children: [
                // #additional info icons
                Row(
                  children: infoIcons
                      .map(
                        (item) => Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: Image.asset(
                            item,
                            width: 40,
                            height: 40,
                          ),
                        ),
                      )
                      .toList(),
                ),
                // #recipe types
                Container(
                  height: 50,
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
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
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
                    style: AppTextStyles.h5,
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

  //#recipe type button
  Widget recipeTypeButton(String recipeType) {
    return TextButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        side: BorderSide(width: 1.0, color: AppColors.primaryLight),
        primary: AppColors.primaryLight.shade50,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      child: Text(
        recipeType,
        style: AppTextStyles.b4Medium.copyWith(color: AppColors.baseLight),
      ),
    );
  }

  //#recipe item
  Widget itemRecipe(RecipeModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 17),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
                child: Image.asset(
                  model.recipeVideo!,
                  height: 390,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // #back button
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: AppColors.baseLight.shade100,
                    ),
                  ),
                  // #time and views
                  Container(
                    width: 121,
                    height: 28,
                    padding: const EdgeInsets.only(bottom: 6),
                    decoration: AppDecorations.defDecor.copyWith(
                      color: AppColors.metalColor.shade70.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SvgPicture.asset(
                          Assets.icons.recipeTime,
                          width: 16,
                          height: 16,
                        ),
                        Text(
                          widget.model.recipeTime ?? '',
                          style: AppTextStyles.h6,
                        ),
                        VerticalDivider(
                          indent: 6,
                          width: 2,
                          thickness: 2,
                          color: AppColors.baseLight.shade100,
                        ),
                        SvgPicture.asset(
                          Assets.icons.recipeView,
                          width: 16,
                          height: 16,
                        ),
                        Text(
                          widget.model.recipeView ?? '',
                          style: AppTextStyles.h6,
                        )
                      ],
                    ),
                  ),
                  // #search button
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: AppColors.baseLight.shade100,
                      size: 30,
                    ),
                  ),
                ],
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
            // #start button
            Positioned(
              bottom: 30,
              right: 20,
              child: TextButton(
                onPressed: () {},
                style: AppDecorations.buttonStyle(padding: const EdgeInsets.symmetric(horizontal: 12)),
                child: Row(
                  children: [
                    Text(
                      'Начать готовить',
                      style: AppTextStyles.b3Medium.copyWith(color: AppColors.baseLight.shade100),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.baseLight.shade100,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
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
                onTap: () {},
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
