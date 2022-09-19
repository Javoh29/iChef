import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ichef/config/constants/app_decorations.dart';
import 'package:ichef/main.dart';
import 'package:ichef/presentation/components/recipe_item.dart';
import 'package:ichef/presentation/widgets/drawer_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../config/constants/app_colors.dart';
import '../../../config/constants/app_text_styles.dart';
import '../../../config/constants/assets.dart';
import '../../../core/utils/flick_multi_manager.dart';
import '../../../core/utils/flick_multi_player.dart';
import '../../../data/models/recipe_model.dart';
import '../../components/blured_panel.dart';
import '../../components/icon_button_action.dart';
import '../../routes/routes.dart';
import '../../widgets/recipe_info_bottom_sheet_items.dart';
import '../favorites/favorites_page.dart';
import 'components/recipe_item_info_panel.dart';

class RecipeInfoPage extends StatefulWidget {
  const RecipeInfoPage({required this.model, required this.seekToTime, Key? key, required this.callBack})
      : super(key: key);
  final RecipeModel model;
  final Duration seekToTime;
  final Function callBack;

  @override
  State<RecipeInfoPage> createState() => _RecipeInfoPageState();
}

class _RecipeInfoPageState extends State<RecipeInfoPage> {
  final FlickMultiManager flickMultiManager = FlickMultiManager();
  bool isVisible = true;
  late final PanelController _listPanelControllers = PanelController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: IngredientsDrawer(
        model: widget.model,
      ),
      body: SlidingUpPanel(
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
        minHeight: MediaQuery.of(context).size.height / 2.1,
        maxHeight: size.height,
        boxShadow: List.empty(),
        controller: _listPanelControllers,
        panel: RecipeItemInfoPanel(
          isVisible: isVisible,
          model: widget.model,
          openDrawer: () {
            _scaffoldKey.currentState?.openEndDrawer();
          },
          seekToTime: widget.seekToTime,
          onPanelClose: () {
            if (_listPanelControllers.isPanelOpen) {
              _listPanelControllers.close();
            }
          },
        ),
        body: itemRecipe(widget.model, size),
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
          Navigator.pushNamed(context, Routes.productWithoutImagePage);
        } else if (recipeType == "Без глютена") {
          Navigator.pushNamed(context, Routes.productSalePage);
        } else if (recipeType == "Масло") {
          Navigator.pushNamed(context, Routes.oilPage);
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
                          widget.model.timeVideo ?? '1.5ч',
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
                        return const BottomSheetModel(
                          children: SingleChildScrollView(
                            child: RecipeInfoPageBottomSheetItems(),
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
      ],
    );
  }
}
