import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ichef/config/constants/assets.dart';
import 'package:ichef/data/models/recipe_model.dart';
import 'package:ichef/presentation/components/blured_panel.dart';
import 'package:ichef/presentation/widgets/drawer_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../config/constants/app_colors.dart';
import '../../../config/constants/app_decorations.dart';
import '../../../config/constants/app_text_styles.dart';
import '../../../config/constants/local_data.dart';
import '../../../core/utils/flick_multi_manager.dart';
import '../../../core/utils/flick_multi_player.dart';
import '../../components/icon_button_action.dart';
import '../../components/svg_circle_button.dart';
import '../../widgets/bottom_textfield_widget.dart';
import '../../widgets/chat_comment_widget.dart';

class RecipeStep extends StatefulWidget {
  const RecipeStep(
      {required this.currentStep, required this.model, required this.stepsLength, required this.seekToTime, Key? key})
      : super(key: key);
  final int currentStep;
  final int stepsLength;
  final RecipeModel model;
  final Duration seekToTime;

  @override
  State<RecipeStep> createState() => _RecipeStepState();
}

class _RecipeStepState extends State<RecipeStep> {
  final FlickMultiManager flickMultiManager = FlickMultiManager();
  final PanelController _panelController = PanelController();
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  late final PageController _pageController;
  late int currentStep;
  late int stepsLength;
  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    currentStep = widget.currentStep;
    stepsLength = widget.stepsLength;
    _pageController = PageController(initialPage: currentStep);
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
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: const IngredientsDrawer(),
      endDrawerEnableOpenDragGesture: false,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                isVisible = true;
                currentStep = index;
              });
            },
            children: List.generate(
              stepsLength,
              (index) {
                return SlidingUpPanel(
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
                  panel: recipeInfo(index),
                  body: Stack(
                    children: [
                      Container(
                        height: size.height * 0.8,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(widget.model.recipeSteps[index]['stepImage']),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: FlickMultiPlayer(
                          url: widget.model.recipeSteps[index]['stepVideo']!,
                          flickMultiManager: flickMultiManager,
                          image: widget.model.recipeSteps[index]['stepImage'],
                          seekToTime: const Duration(seconds: 0),
                        ),
                      ),
                      SafeArea(
                        child: Align(
                          alignment: const Alignment(0.9, -1.0),
                          child: IconButtonAction(
                            onTap: () {
                              _scaffoldKey.currentState?.openEndDrawer();
                            },
                            icon: Assets.icons.ingredients,
                            lable: '7',
                            height: 32,
                            borderRadius: 12,
                            isActive: true,
                            textStyle: AppTextStyles.b4DemiBold.copyWith(color: AppColors.primaryLight.shade100),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Visibility(
            visible: isVisible,
            child: bottomNavigation(currentStep),
          ),
          Visibility(
            visible: !isVisible,
            child: BottomTextFiledWidget(
              mLeading: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  Assets.icons.add,
                  color: AppColors.metalColor.shade100,
                ),
              ),
              mTrailing: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  Assets.icons.share,
                  color: AppColors.metalColor.shade100,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomNavigation(index) {
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
            index != 0
                ? SvgCircleButton(
                    size: 42,
                    icon: Assets.icons.backArrow,
                    iconColor: AppColors.metalColor.shade100,
                    iconSize: 14,
                    mOnTap: () {
                      if (index != 0) {
                        _pageController.previousPage(
                          curve: Curves.easeIn,
                          duration: const Duration(milliseconds: 400),
                        );
                      }
                    })
                : const SizedBox(
                    width: 42,
                    height: 42,
                  ),
            SvgCircleButton(
              size: 42,
              icon: Assets.icons.cancel,
              mOnTap: () => Navigator.pop(context),
            ),
            index + 1 != stepsLength
                ? SvgCircleButton(
                    size: 42,
                    icon: Assets.icons.nextArrow,
                    iconSize: 14,
                    mOnTap: () {
                      if (index + 1 != stepsLength) {
                        _pageController.nextPage(
                          curve: Curves.easeIn,
                          duration: const Duration(milliseconds: 400),
                        );
                      }
                    })
                : const SizedBox(
                    width: 42,
                    height: 42,
                  ),
          ],
        ),
      ),
    );
  }

  Widget recipeInfo(index) {
    String currentStepName = index == 0
        ? "Начать"
        : stepsLength > index + 1
            ? "•••"
            : "Завершить";
    Color currentStepBgColor = index + 1 == stepsLength ? AppColors.accentLight : AppColors.primaryLight;
    Widget currentStepIcon = index == 0
        ? Icon(
            Icons.arrow_forward_ios,
            color: AppColors.baseLight.shade100,
            size: 16,
          )
        : index + 1 < stepsLength
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
            decoration: BoxDecoration(
              color: AppColors.baseLight.shade100,
              borderRadius: const BorderRadius.only(
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
                  widget.model.recipeSteps[index]['stepName'],
                  textAlign: TextAlign.center,
                  style: AppTextStyles.h7,
                ),
                const SizedBox(height: 20),
                Text(
                  widget.model.recipeSteps[index]['stepContext'],
                  style: AppTextStyles.h5,
                ),
                const SizedBox(height: 30),
                ...userComments.map(
                  (userComment) {
                    return ChatCommentWidget(
                      userName: userComment["userName"],
                      userImage: userComment["userImage"],
                      lastSeen: userComment["lastSeen"],
                      time: userComment["time"],
                      chatText: userComment["chatText"],
                      isOwner: userComment["isOwner"],
                    );
                  },
                ),
                const SizedBox(height: 50),
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
              '${index + 1} из $stepsLength',
              style: AppTextStyles.b3Medium.copyWith(color: AppColors.baseLight.shade100),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 20,
          child: TextButton.icon(
            onPressed: () {
              if (index + 1 == stepsLength) {
                Navigator.pop(context);
              } else {
                _pageController.nextPage(
                  curve: Curves.easeIn,
                  duration: const Duration(milliseconds: 400),
                );
              }
            },
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
}
