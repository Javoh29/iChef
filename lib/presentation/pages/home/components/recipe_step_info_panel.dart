import 'package:flutter/material.dart';
import 'package:ichef/data/models/recipe_model.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_decorations.dart';
import '../../../../config/constants/app_text_styles.dart';
import '../../../../config/constants/assets.dart';
import '../../../../config/constants/local_data.dart';
import '../../../components/blured_panel.dart';
import '../../../widgets/chat_comment_widget.dart';

class RecipeStepInfoPanel extends StatefulWidget {
  const RecipeStepInfoPanel(
      {required this.index,
      required this.stepsLength,
      required this.isVisible,
      required this.onNextPage,
      required this.onPanelClose,
      required this.stepName,
      required this.stepContext,
      Key? key,
      required this.model})
      : super(key: key);
  final int index;
  final int stepsLength;
  final bool isVisible;
  final String stepName;
  final String stepContext;
  final RecipeModel model;
  final Function() onNextPage;
  final Function() onPanelClose;

  @override
  State<RecipeStepInfoPanel> createState() => _RecipeStepInfoPanelState();
}

class _RecipeStepInfoPanelState extends State<RecipeStepInfoPanel> {
  final ScrollController _scrollController = ScrollController();
  bool isOpenPanel = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset < -50 && isOpenPanel) {
        widget.onPanelClose();
        isOpenPanel = false;
      } else {
        isOpenPanel = true;
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
    String currentStepName = widget.index == 1
        ? "Начать"
        : widget.stepsLength > widget.index
            ? "•••"
            : "Завершить";
    Color currentStepBgColor = widget.index == widget.stepsLength ? AppColors.accentLight : AppColors.primaryLight;
    Widget currentStepIcon = widget.index == 1
        ? Icon(
            Icons.arrow_forward_ios,
            color: AppColors.baseLight.shade100,
            size: 16,
          )
        : widget.index < widget.stepsLength
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
              physics: widget.isVisible ? const NeverScrollableScrollPhysics() : const BouncingScrollPhysics(),
              shrinkWrap: true,
              controller: _scrollController,
              children: [
                Text(
                  widget.stepName,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.h6.copyWith(fontSize: 20, color: AppColors.metalColor.shade100, height: 1.6),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.stepContext,
                  style: AppTextStyles.h5.copyWith(height: 1.6, fontSize: 16),
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
              '${widget.index} из ${widget.stepsLength}',
              style: AppTextStyles.b3Medium.copyWith(color: AppColors.baseLight.shade100),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 20,
          child: TextButton.icon(
            onPressed: () {
              if (widget.index == widget.stepsLength) {
                Navigator.pop(context);
              } else {
                widget.onNextPage();
              }
            },
            style: AppDecorations.buttonStyle(padding: const EdgeInsets.symmetric(horizontal: 12), borderRadius: 12)
                .copyWith(
              backgroundColor: MaterialStateProperty.all(currentStepBgColor),
              overlayColor: MaterialStateProperty.all(AppColors.baseLight.shade20),
            ),
            icon: Text(
              currentStepName,
              style: AppTextStyles.b4Medium.copyWith(color: AppColors.baseLight.shade100),
            ),
            label: currentStepIcon,
          ),
        ),
      ],
    );
  }
}
