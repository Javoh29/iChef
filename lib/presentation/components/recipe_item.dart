import 'package:flutter/material.dart';
import 'package:ichef/data/models/recipe_model.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_text_styles.dart';
import '../../config/constants/assets.dart';
import '../../core/utils/flick_multi_manager.dart';
import '../../core/utils/flick_multi_player.dart';
import '../routes/routes.dart';
import 'icon_button_action.dart';

class RecipeItem extends StatefulWidget {
  const RecipeItem(
      {required this.model,
      this.borderRadius,
      this.listAdditional,
      this.seekToTime,
      this.isTap = true,
      this.openDrawer,
      Key? key})
      : super(key: key);
  final RecipeModel model;
  final double? borderRadius;
  final List<Widget>? listAdditional;
  final Duration? seekToTime;
  final bool isTap;
  final Function()? openDrawer;

  @override
  State<RecipeItem> createState() => _RecipeItemState();
}

class _RecipeItemState extends State<RecipeItem> {
  final FlickMultiManager flickMultiManager = FlickMultiManager();
  bool isLike = false;
  int likeCount = 10;

  @override
  void initState() {
    likeCount = widget.model.likeCount ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            GestureDetector(
              onTap: () {
                if (widget.isTap) {
                  flickMultiManager.getTime().then((value) {
                    Navigator.pushNamed(
                      context,
                      Routes.recipeInfoPage,
                      arguments: {
                        'recipe_model': widget.model,
                        'seek_to_time': value
                      },
                    );
                  });
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 17),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(widget.borderRadius ?? 35),
                      topRight: Radius.circular(widget.borderRadius ?? 35)),
                  child: AspectRatio(
                    aspectRatio: 3 / 4,
                    child: FlickMultiPlayer(
                      url: widget.model.recipeVideo!,
                      flickMultiManager: flickMultiManager,
                      image: widget.model.recipeVideoPoster,
                      seekToTime: widget.seekToTime,
                    ),
                  ),
                ),
              ),
            ),
            widget.isTap
                ? GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, Routes.profilePage),
                    child: Container(
                      height: 34,
                      width: 34,
                      margin: const EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: AppColors.baseLight.shade100, width: 2),
                        image: DecorationImage(
                          image: AssetImage(widget.model.userAvatar!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                : Container(),
            if (widget.listAdditional != null) ...widget.listAdditional!
          ],
        ),
        widget.isTap
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, Routes.profilePage),
                  child: RichText(
                    text: TextSpan(
                      text: widget.model.userName,
                      style: AppTextStyles.b4Regular
                          .copyWith(color: AppColors.metalColor.shade100),
                      children: [
                        TextSpan(
                          text: ' · ',
                          style: AppTextStyles.b4Regular
                              .copyWith(color: AppColors.metalColor.shade50),
                          children: [
                            TextSpan(text: widget.model.categoryName),
                          ],
                        ),
                        TextSpan(
                            text: '\n${widget.model.recipeName}',
                            style: AppTextStyles.h4)
                      ],
                    ),
                  ),
                ),
              )
            : Container(),
        widget.isTap
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                child: Row(
                  children: [
                    IconButtonAction(
                      onTap: () {
                        setState(() {});
                        isLike = !isLike;
                      },
                      icon: isLike ? Assets.icons.likeRed : Assets.icons.like,
                      lable: isLike
                          ? '${likeCount + 1}'
                          : widget.model.likeCount.toString(),
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
                      textStyle: AppTextStyles.b4DemiBold
                          .copyWith(color: AppColors.primaryLight.shade100),
                    )
                  ],
                ),
              )
            : Container()
      ],
    );
  }
}
