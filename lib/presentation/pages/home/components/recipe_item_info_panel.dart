import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ichef/data/models/recipe_model.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_decorations.dart';
import '../../../../config/constants/app_text_styles.dart';
import '../../../../config/constants/assets.dart';
import '../../../../config/constants/local_data.dart';
import '../../../../main.dart';
import '../../../components/custom_bottom_sheet.dart';
import '../../../components/icon_button_action.dart';
import '../../../components/recipe_step_card.dart';
import '../../../routes/routes.dart';
import '../../../widgets/chat_comment_widget.dart';
import '../../../widgets/scale_widget.dart';

class RecipeItemInfoPanel extends StatefulWidget {
  const RecipeItemInfoPanel(
      {Key? key,
      required this.model,
      required this.isVisible,
      this.openDrawer,
      required this.seekToTime,
      required this.onPanelClose})
      : super(key: key);

  final RecipeModel model;
  final bool isVisible;
  final Function()? openDrawer;
  final Duration seekToTime;
  final Function() onPanelClose;

  @override
  State<RecipeItemInfoPanel> createState() => _RecipeItemInfoPanelState();
}

class _RecipeItemInfoPanelState extends State<RecipeItemInfoPanel> {
  final ScrollController _scrollController = ScrollController();
  bool isOpenPanel = true;
  bool isLike = false;
  int likeCount = 10;

  @override
  void initState() {
    likeCount = widget.model.likeCount ?? 0;
    _scrollController.addListener(() {
      if (_scrollController.offset < -50 && isOpenPanel) {
        widget.onPanelClose();
        isOpenPanel = false;
      } else {
        isOpenPanel = true;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          margin: const EdgeInsets.only(top: 60),
          decoration: BoxDecoration(
            color: AppColors.baseLight.shade100,
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            physics: widget.isVisible ? const NeverScrollableScrollPhysics() : const BouncingScrollPhysics(),
            shrinkWrap: true,
            controller: _scrollController,
            children: [
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, Routes.profilePage),
                child: RichText(
                  text: TextSpan(
                    text: widget.model.userName,
                    style: AppTextStyles.b4Regular.copyWith(color: AppColors.metalColor.shade100),
                    children: [
                      TextSpan(
                        text: ' · ',
                        style: AppTextStyles.b4Regular.copyWith(color: AppColors.metalColor.shade50),
                        children: [
                          TextSpan(text: widget.model.categoryName),
                        ],
                      ),
                      TextSpan(text: '\n${widget.model.recipeName}', style: AppTextStyles.h4)
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    IconButtonAction(
                      onTap: () {
                        setState(() {});
                        // isLike = !isLike;
                      },
                      icon: isLike ? Assets.icons.likeRed : Assets.icons.like,
                      lable: isLike ? '${likeCount + 1}' : widget.model.likeCount.toString(),
                      isActive: true,
                    ),
                    IconButtonAction(
                      onTap: () {},
                      icon: Assets.icons.comment,
                      lable: widget.model.likeCount.toString(),
                    ),
                    IconButtonAction(
                      onTap: () {},
                      icon: Assets.icons.variation,
                      lable: widget.model.likeCount.toString(),
                    ),
                    IconButtonAction(
                      onTap: () {},
                      icon: Assets.icons.share,
                    ),
                    const Spacer(),
                    IconButtonAction(
                      onTap: widget.openDrawer ??
                          () {
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
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.end,
                children: [
                  Text(
                    'Десерты',
                    style: AppTextStyles.h5.copyWith(fontSize: 15),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    ),
                  ),
                  Text(
                    'Выпечка',
                    style: AppTextStyles.h5.copyWith(fontSize: 15),
                  ),
                ],
              ),
              // #recipe info
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 15),
                child: Text(
                  '${widget.model.recipeDesc}',
                  style: AppTextStyles.h5.copyWith(color: AppColors.metalColor.shade70, fontSize: 15),
                ),
              ),
              //Recipe prepairing steps
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
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
              ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.model.userComment.length,
                  itemBuilder: (context, index) => ChatCommentWidget(
                        userName: widget.model.userComment[index]["userName"],
                        userImage: widget.model.userComment[index]["userImage"],
                        lastSeen: widget.model.userComment[index]["lastSeen"],
                        time: widget.model.userComment[index]["time"],
                        chatText: widget.model.userComment[index]["chatText"],
                        isOwner: widget.model.userComment[index]["isOwner"],
                      )),
              const SizedBox(height: 60),
            ],
          ),
        ),

        Container(
          height: 34,
          width: 34,
          margin: const EdgeInsets.only(left: 15, top: 43),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.baseLight.shade100, width: 2),
            image: DecorationImage(
              image: AssetImage(widget.model.userAvatar!),
              fit: BoxFit.cover,
            ),
          ),
        ),

        Positioned(
          right: 20,
          child: TextButton.icon(
            onPressed: () => MyApp.navigatorKey.currentState?.pushNamed(Routes.recipeStepPage, arguments: {
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

        // Align(
        //   alignment: Alignment.topCenter,
        //   child: BluredPanel(
        //     mBorderRadius: 20,
        //     mHeight: 30,
        //     mPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        //     mMargin: const EdgeInsets.only(top: 10),
        //     widget: Text(
        //       '${widget.index} из ${widget.stepsLength}',
        //       style: AppTextStyles.b3Medium
        //           .copyWith(color: AppColors.baseLight.shade100),
        //     ),
        //   ),
        // ),
        // Positioned(
        //   top: 0,
        //   right: 20,
        //   child: TextButton.icon(
        //     onPressed: () {
        //       if (widget.index == widget.stepsLength) {
        //         Navigator.pop(context);
        //       } else {
        //         widget.onNextPage();
        //       }
        //     },
        //     style: AppDecorations.buttonStyle(
        //             padding: const EdgeInsets.symmetric(horizontal: 12),
        //             borderRadius: 12)
        //         .copyWith(
        //       backgroundColor: MaterialStateProperty.all(currentStepBgColor),
        //       overlayColor:
        //           MaterialStateProperty.all(AppColors.baseLight.shade20),
        //     ),
        //     icon: Text(
        //       currentStepName,
        //       style: AppTextStyles.b4Medium
        //           .copyWith(color: AppColors.baseLight.shade100),
        //     ),
        //     label: currentStepIcon,
        //   ),
        // ),
      ],
    );
  }

  //#recipe type button
  Widget recipeTypeButton(String recipeType) {
    return TextButton(
      onPressed: () {
        if (recipeType == "Panasonic 1259") {
          Navigator.pushNamed(context, Routes.productWithoutImagePage);
        } else if (recipeType == "Без глютена") {
          Navigator.pushNamed(context, Routes.productSalePage);
        } else if (recipeType == "Масло") {
          Navigator.pushNamed(context, Routes.oilPage);
        }
      },
      style: AppDecorations.buttonStyle(
        bgColor: AppColors.primaryLight.shade50,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        borderRadius: 12,
        border: BorderSide(color: AppColors.primaryLight.shade100, width: 1),
      ),
      child: Text(
        recipeType,
        style: AppTextStyles.b4Medium.copyWith(color: AppColors.baseLight, fontSize: 13.5),
      ),
    );
  }
}
