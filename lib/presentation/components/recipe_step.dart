import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ichef/config/constants/app_colors.dart';
import 'package:ichef/config/constants/app_decorations.dart';
import 'package:ichef/config/constants/app_text_styles.dart';
import 'package:ichef/config/constants/assets.dart';

class RecipeStep extends StatelessWidget {
  const RecipeStep({
    Key? key,
    required this.size,
    required this.stepNumber,
    required this.stepName,
    required this.stepContext,
  }) : super(key: key);

  final Size size;
  final String stepNumber;
  final String stepName;
  final String stepContext;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 12),
      height: size.height * 0.25,
      decoration: AppDecorations.defDecor.copyWith(color: AppColors.metalColor.shade10),
      child: Column(
        children: [
          // #video and step name
          Expanded(
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 50,
                      height: 100,
                      margin: const EdgeInsets.only(right: 20),
                      decoration: AppDecorations.defDecor.copyWith(
                        image: DecorationImage(image: AssetImage(Assets.images.recipePrepaireOne), fit: BoxFit.cover),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.metalColor.shade70,
                        ),
                        child: Icon(
                          CupertinoIcons.play,
                          size: 16,
                          color: AppColors.metalColor.shade10,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        stepNumber,
                        style: AppTextStyles.b4DemiBold.copyWith(color: AppColors.metalColor.shade50),
                      ),
                      Text(
                        stepName,
                        style: AppTextStyles.b1Regular.copyWith(fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 27,
                  height: 27,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.baseLight),
                  child: Center(
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.metalColor.shade10,
                      size: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // #content about step
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text(
                stepContext,
                style: AppTextStyles.h5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
