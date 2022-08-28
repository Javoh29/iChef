import 'package:flutter/material.dart';
import 'package:ichef/config/constants/assets.dart';
import 'package:ichef/presentation/components/blured_panel.dart';
import 'package:ichef/presentation/widgets/drawer_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../config/constants/app_colors.dart';
import '../../../config/constants/app_decorations.dart';
import '../../../config/constants/app_text_styles.dart';
import '../../../config/constants/local_data.dart';
import '../../components/icon_button_action.dart';
import '../../components/svg_circle_button.dart';

class RecipeStep extends StatefulWidget {
  const RecipeStep({required this.currentStep, required this.stepsLength, Key? key}) : super(key: key);
  final int currentStep;
  final int stepsLength;

  @override
  State<RecipeStep> createState() => _RecipeStepState();
}

class _RecipeStepState extends State<RecipeStep> {
  final PanelController _panelController = PanelController();
  final ScrollController _scrollController = ScrollController();
  late int currentStep;
  late int stepsLength;
  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    currentStep = widget.currentStep;
    stepsLength = widget.stepsLength;
    _scrollController.addListener(() {
      if (_scrollController.offset < -50) {
        if (_panelController.isPanelOpen) {
          _panelController.close();
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: const IngredientsDrawer(),
      endDrawerEnableOpenDragGesture: false,
      body: Stack(
        children: [
          SlidingUpPanel(
            onPanelClosed: () {
              setState(() {
                isVisible = true;
              });
            },
            onPanelOpened: () {
              setState(() {
                isVisible = false;
              });
            },
            color: Colors.transparent,
            minHeight: size.height * 0.3,
            maxHeight: size.height,
            boxShadow: List.empty(),
            controller: _panelController,
            panel: recipeInfo(),
            body: Stack(
              children: [
                Container(
                  height: size.height * 0.8,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Assets.images.recipePrepaireOne),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SafeArea(
                  child: Align(
                    alignment: const Alignment(0.9, -1.0),
                    child: IconButtonAction(
                      onTap: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      icon: Assets.icons.ingredients,
                      lable: '7',
                      height: 32,
                      borderRadius: 12,
                      isActive: true,
                      textStyle: AppTextStyles.b4DemiBold.copyWith(color: AppColors.primaryLight.shade100),
                    ),
                  ),
                )
              ],
            ),
          ),
          Visibility(
            visible: isVisible,
            child: bottomNavigation(),
          ),
        ],
      ),
    );
  }

  Widget bottomNavigation() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            colors: [
              AppColors.metalColor.shade10.withOpacity(0.2),
              AppColors.metalColor.shade10.withOpacity(0.9),
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            currentStep != 1
                ? SvgCircleButton(
                    size: 42,
                    icon: Assets.icons.backArrow,
                    iconColor: AppColors.metalColor.shade100,
                    iconSize: 14,
                    mOnTap: () => setState(() {
                          currentStep--;
                        }))
                : const SizedBox(
                    width: 42,
                    height: 42,
                  ),
            SvgCircleButton(
              size: 42,
              icon: Assets.icons.cancel,
              mOnTap: () => Navigator.pop(context),
            ),
            currentStep != stepsLength
                ? SvgCircleButton(
                    size: 42,
                    icon: Assets.icons.nextArrow,
                    iconSize: 14,
                    mOnTap: () => setState(() {
                          currentStep++;
                        }))
                : const SizedBox(
                    width: 42,
                    height: 42,
                  ),
          ],
        ),
      ),
    );
  }

  Widget recipeInfo() {
    String currentStepName = currentStep == 1
        ? "Начать"
        : stepsLength > currentStep
            ? "•••"
            : "Завершить";
    Color currentStepBgColor = currentStep == stepsLength ? AppColors.accentLight : AppColors.primaryLight;
    Widget currentStepIcon = currentStep == 1
        ? Icon(
            Icons.arrow_forward_ios,
            color: AppColors.baseLight.shade100,
            size: 16,
          )
        : currentStep < stepsLength
            ? Image(
                image: AssetImage(
                  Assets.icons.coffee,
                ),
                width: 16,
              )
            : const SizedBox.shrink();
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 25),
          child: Container(
            padding: const EdgeInsets.all(30),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: ListView(
              padding: EdgeInsets.zero,
              physics: isVisible ? const NeverScrollableScrollPhysics() : const BouncingScrollPhysics(),
              shrinkWrap: true,
              controller: _scrollController,
              children: [
                Text(
                  stepName,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.h7,
                ),
                const SizedBox(height: 20),
                Text(
                  stepContext,
                  style: AppTextStyles.h5,
                ),
                const SizedBox(height: 30),
                ...userComments.map(
                  (userComment) {
                    return chatItem(
                      userName: userComment["userName"],
                      userImage: userComment["userImage"],
                      lastSeen: userComment["lastSeen"],
                      time: userComment["time"],
                      chatText: userComment["chatText"],
                    );
                  },
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: BluredPanel(
            mBorderRadius: 20,
            mHeight: 30,
            mPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            mMargin: const EdgeInsets.only(top: 10),
            widget: Text(
              '$currentStep из $stepsLength',
              style: AppTextStyles.b3Medium.copyWith(color: AppColors.baseLight.shade100),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 20,
          child: TextButton.icon(
            onPressed: () {},
            style: AppDecorations.buttonStyle(padding: const EdgeInsets.symmetric(horizontal: 12), borderRadius: 12)
                .copyWith(
              backgroundColor: MaterialStateProperty.all(currentStepBgColor),
              overlayColor: MaterialStateProperty.all(AppColors.baseLight.shade20),
            ),
            icon: Text(
              currentStepName,
              style: AppTextStyles.b3Medium.copyWith(color: AppColors.baseLight.shade100),
            ),
            label: currentStepIcon,
          ),
        ),
      ],
    );
  }

  Widget chatItem({String? userName, String? userImage, String? lastSeen, String? time, String? chatText}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Container(
                width: 34,
                height: 34,
                margin: const EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(userImage!),
                  ),
                ),
              ),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    text: userName,
                    style: AppTextStyles.b4Medium
                        .copyWith(color: AppColors.metalColor.shade100, fontWeight: FontWeight.w700),
                    children: [
                      TextSpan(
                        text: ' · ',
                        style: AppTextStyles.b4Regular.copyWith(color: AppColors.metalColor.shade50),
                        children: [
                          TextSpan(text: lastSeen),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                time!,
                style: AppTextStyles.h5.copyWith(color: AppColors.metalColor.shade100, fontSize: 12),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.metalColor.shade10,
          ),
          child: Text(
            chatText!,
            style: AppTextStyles.h5,
          ),
        ),
        Row(
          children: [
            Image(
              image: AssetImage(Assets.images.smile),
              width: 16,
            ),
            Expanded(
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.baseLight),
                    ),
                    child: const Text('😎 112'),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.baseLight),
                    ),
                    child: const Text('😍 1'),
                  ),
                ],
              ),
            ),
            Text(
              "Изменить",
              style: AppTextStyles.h5.copyWith(color: AppColors.metalColor.shade100, fontSize: 12),
            ),
            const SizedBox(width: 20),
            Text(
              "Удалить",
              style: AppTextStyles.h5.copyWith(color: AppColors.metalColor.shade100, fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }
}
