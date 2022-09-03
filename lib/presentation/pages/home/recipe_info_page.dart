import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ichef/config/constants/app_decorations.dart';
import 'package:ichef/main.dart';
import 'package:ichef/presentation/components/recipe_item.dart';
import 'package:ichef/presentation/components/recipe_step_card.dart';
import 'package:ichef/presentation/widgets/drawer_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../config/constants/app_colors.dart';
import '../../../config/constants/app_text_styles.dart';
import '../../../config/constants/assets.dart';
import '../../../config/constants/local_data.dart';
import '../../../data/models/recipe_model.dart';
import '../../components/blured_panel.dart';
import '../../components/custom_bottom_sheet.dart';
import '../../routes/routes.dart';
import '../../widgets/scale_widget.dart';

class RecipeInfoPage extends StatefulWidget {
  const RecipeInfoPage({required this.model, required this.seekToTime, Key? key}) : super(key: key);
  final RecipeModel model;
  final Duration seekToTime;

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
          itemRecipe(widget.model, size),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        showCupertinoModalBottomSheet(
                          topRadius: const Radius.circular(30),
                          bounce: true,
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (BuildContext context) {
                            return CustomBottomSheet(
                              mHeight: size.height * 0.4,
                              mPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                              mBorderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                              mBgColor: AppColors.baseLight.shade100,
                              mAppBar: Stack(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(top: 7),
                                    height: 50,
                                    width: double.infinity,
                                    child: Text(
                                      'Перенести',
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.h5.copyWith(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    child: ScaleWidget(
                                      mOnTap: () => Navigator.pop(context),
                                      scale: .7,
                                      child: Container(
                                        height: 34,
                                        width: 34,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.metalColor.shade10,
                                        ),
                                        child: SvgPicture.asset(
                                          Assets.icons.cancel,
                                          height: 16,
                                          width: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              mBody: SingleChildScrollView(
                                child: Column(
                                  children: List.generate(
                                    folders.length,
                                    (index) => Container(
                                      decoration: AppDecorations.defDecor,
                                      margin: const EdgeInsets.symmetric(vertical: 3),
                                      child: ListTile(
                                        title: Text(
                                          folders[index],
                                          style: AppTextStyles.h5.copyWith(fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      icon: SvgPicture.asset(Assets.icons.folder),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                        ),
                        backgroundColor: MaterialStateProperty.all(AppColors.metalColor.shade10),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      label: Text(
                        'Приготовлено',
                        style: AppTextStyles.h5.copyWith(
                          color: AppColors.metalColor.shade50,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, top: 5),
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          Assets.icons.recipeTime,
                          color: AppColors.metalColor.shade50,
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                          ),
                          backgroundColor: MaterialStateProperty.all(AppColors.metalColor.shade10),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        label: Text(
                          '${widget.model.recipeTime}',
                          style: AppTextStyles.h5.copyWith(
                            color: AppColors.metalColor.shade50,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // #recipe types
                Container(
                  height: 40,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
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
                    '${widget.model.recipeDesc}',
                    style: AppTextStyles.h5.copyWith(
                      color: AppColors.metalColor.shade70,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Recipe prepairing steps
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: List.generate(widget.model.recipeSteps.length, ((index) {
                return RecipeStepCard(
                  size: size,
                  stepImage: widget.model.recipeSteps[index]['stepImage'],
                  currentStep: index,
                  stepsLength: widget.model.recipeSteps.length,
                  stepNumber: widget.model.recipeSteps[index]['stepNumber'],
                  stepName: widget.model.recipeSteps[index]['stepName'],
                  stepContext: widget.model.recipeSteps[index]['stepContext'],
                  model: widget.model,
                  seekToTime: widget.seekToTime,
                );
              })),
            ),
          ),
          const SizedBox(height: 60),
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
      onPressed: () {
        if (recipeType == "Panasonic 1259") {
          MyApp.navigatorKey.currentState?.pushNamed(Routes.productWithoutImagePage);
        } else if (recipeType == "Без глютена") {
          MyApp.navigatorKey.currentState?.pushNamed(Routes.productSalePage);
        } else {
          MyApp.navigatorKey.currentState?.pushNamed(Routes.productPage);
        }
      },
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
  Widget itemRecipe(RecipeModel model, Size size) {
    return RecipeItem(
      model: model,
      borderRadius: 0,
      seekToTime: widget.seekToTime,
      isTap: false,
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
                  icon: SvgPicture.asset(
                    Assets.icons.backArrow,
                  ),
                ),
                // #time and views
                BluredPanel(
                  mHeight: 28,
                  mPadding: const EdgeInsets.symmetric(horizontal: 5),
                  mBorderRadius: 18,
                  widget: Row(
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
                // #more button
                IconButton(
                  onPressed: () {
                    showCupertinoModalBottomSheet(
                      topRadius: const Radius.circular(30),
                      bounce: true,
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (BuildContext context) {
                        return CustomBottomSheet(
                          mHeight: size.height * 0.55,
                          mPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                          mBorderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                          mBgColor: AppColors.baseLight.shade100,
                          mAppBar: null,
                          mBody: SingleChildScrollView(
                            child: Column(
                              children: List.generate(
                                commands.length,
                                (index) => Container(
                                  decoration: AppDecorations.defDecor,
                                  margin: const EdgeInsets.symmetric(vertical: 3),
                                  child: ListTile(
                                    leading: Checkbox(
                                      onChanged: (bool? value) {},
                                      value: Random.secure().nextBool(),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10))),
                                    ),
                                    title: Text(
                                      commands[index],
                                      style: AppTextStyles.h5.copyWith(fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  icon: SvgPicture.asset(Assets.icons.more),
                  iconSize: 18,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          right: 20,
          child: TextButton.icon(
            onPressed: () => MyApp.navigatorKey.currentState
                ?.pushNamed(Routes.recipeStepPage, arguments: {
              "currentStep": 0,
              "stepsLength": widget.model.recipeSteps.length,
              "recipeModel": model,
              "seekToTime": widget.seekToTime,
              "pageIndex": 0,
            }),
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
