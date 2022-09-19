import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ichef/config/constants/app_colors.dart';
import 'package:ichef/config/constants/app_decorations.dart';
import 'package:ichef/config/constants/app_text_styles.dart';
import 'package:ichef/config/constants/assets.dart';

import '../../data/models/recipe_model.dart';
import '../../main.dart';
import '../routes/routes.dart';

class RecipeStepCard extends StatelessWidget {
  const RecipeStepCard({
    Key? key,
    required this.size,
    required this.stepNumber,
    required this.stepName,
    required this.stepContext,
    required this.currentStep,
    required this.stepsLength,
    required this.model,
    required this.seekToTime,
    required this.stepImage,
  }) : super(key: key);

  final Size size;
  final String stepNumber;
  final String stepName;
  final String stepContext;
  final int currentStep;
  final int stepsLength;
  final RecipeModel model;
  final Duration seekToTime;
  final String stepImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => MyApp.navigatorKey.currentState?.pushNamed(Routes.recipeStepPage, arguments: {
        "currentStep": currentStep,
        "stepsLength": stepsLength,
        "recipeModel": model,
        "seekToTime": seekToTime,
      }),
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: AppDecorations.defDecor
            .copyWith(color: AppColors.metalColor.shade10, borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            // #video and step name
            Row(
              children: [
                Container(
                  width: 50,
                  height: 90,
                  margin: const EdgeInsets.only(right: 20),
                  alignment: Alignment.center,
                  decoration: AppDecorations.defDecor.copyWith(
                    image: DecorationImage(image: AssetImage(stepImage), fit: BoxFit.cover),
                  ),
                  child: Container(
                    width: 32,
                    height: 32,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.metalColor.shade70,
                    ),
                    child: SvgPicture.asset(
                      Assets.icons.playBtn,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        stepNumber,
                        style: AppTextStyles.b4DemiBold.copyWith(color: AppColors.metalColor.shade40, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        stepName,
                        style: AppTextStyles.b1Regular.copyWith(fontWeight: FontWeight.w700, fontSize: 16),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 27,
                  height: 27,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.baseLight),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppColors.metalColor.shade10,
                    size: 12,
                  ),
                ),
              ],
            ),
            // #content about step
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text(
                stepContext,
                style: AppTextStyles.h5.copyWith(color: AppColors.metalColor.shade70),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
