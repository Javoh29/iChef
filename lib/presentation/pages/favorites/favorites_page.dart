import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ichef/config/constants/assets.dart';
import 'package:ichef/config/constants/local_data.dart';
import 'package:ichef/presentation/pages/favorites/favorite_tab_page.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../config/constants/app_colors.dart';
import '../../../config/constants/app_decorations.dart';
import '../../../config/constants/app_text_styles.dart';
import '../../components/custom_badge.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 4, vsync: this);
  List tabList = [
    'Понравилось',
    'К готовке',
    'Приготовлено',
    'Любимые',
  ];

  @override
  void initState() {
    super.initState();
    _tabController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      physics: const NeverScrollableScrollPhysics(),
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return <Widget>[
          appBar(innerBoxIsScrolled, context),
        ];
      },
      body: TabBarView(
        controller: _tabController,
        children: [
          FavoritesTabPage(
            listImages: favImagesTab1,
          ),
          FavoritesTabPage(
            listImages: favImagesTab2,
          ),
          FavoritesTabPage(
            listImages: favImagesTab1,
          ),
          FavoritesTabPage(
            listImages: favImagesTab2,
          ),
        ],
      ),
    );
  }

  SliverAppBar appBar(bool innerBoxIsScrolled, BuildContext context) {
    return SliverAppBar(
      pinned: true,
      snap: true,
      floating: true,
      centerTitle: true,
      automaticallyImplyLeading: false,
      forceElevated: innerBoxIsScrolled,
      title: Text(
        'Избранное',
        style: AppTextStyles.b5Regular.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset(Assets.icons.filter),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(Assets.icons.threePoint),
          onPressed: () {
            showCupertinoModalBottomSheet(
              context: context,
              bounce: true,
              topRadius: const Radius.circular(30),
              builder: (context) {
                return BottomSheetModel(
                  children: Column(
                    children: [
                      BSheetItemWidget(
                        title: 'Переименовать папку',
                        onTap: () {},
                        leading: SvgPicture.asset(Assets.icons.variation),
                      ),
                      BSheetItemWidget(
                        title: 'Переименовать папку',
                        onTap: () {},
                        leading: SvgPicture.asset(Assets.icons.variation),
                      ),
                      BSheetItemWidget(
                        title: 'Переименовать папку',
                        onTap: () {},
                        leading: SvgPicture.asset(Assets.icons.variation),
                      ),
                      BSheetItemWidget(
                        title: 'Переименовать папку',
                        onTap: () {},
                        leading: SvgPicture.asset(Assets.icons.variation),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ],
      bottom: tabBar(),
    );
  }

  TabBar tabBar() {
    return TabBar(
      isScrollable: true,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      controller: _tabController,
      unselectedLabelStyle:
          AppTextStyles.b5Regular.copyWith(color: AppColors.metalColor.shade50),
      labelStyle: AppTextStyles.b5Regular.copyWith(color: AppColors.baseLight),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(width: 4.0, color: AppColors.primaryLight),
      ),
      tabs: List.generate(
        4,
        (index) {
          return Tab(
            height: 22,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(tabList[index]),
                CustomBadge(
                  text: '24K',
                  isActive: _tabController.index == index,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class BottomSheetModel extends StatelessWidget {
  const BottomSheetModel({
    Key? key,
    this.title,
    this.actions,
    this.leadingIcon,
    required this.children,
  }) : super(key: key);
  final Widget? title;
  final List<Widget>? actions;
  final Widget children;
  final String? leadingIcon;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            title != null
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: AppBar(
                      elevation: 0,
                      leadingWidth: 34,
                      toolbarHeight: 36,
                      leading: Container(
                        width: 34,
                        height: 34,
                        decoration: AppDecorations.defDecor.copyWith(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: IconButton(
                          splashRadius: 1,
                          onPressed: () {
                            debugPrint('OnTap');
                          },
                          icon: SvgPicture.asset(
                            '$leadingIcon',
                            fit: BoxFit.none,
                          ),
                        ),
                      ),
                      title: title,
                      actions: actions ??
                          [
                            TextButton(
                              onPressed: () {},
                              style: AppDecorations.buttonStyle(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                borderRadius: 12,
                              ),
                              child: Text(
                                'Добавить',
                                style: AppTextStyles.b4Medium.copyWith(
                                  color: AppColors.baseLight.shade100,
                                ),
                              ),
                            )
                          ],
                    ),
                  )
                : Container(),
            children
          ],
        ),
      ),
    );
  }
}

class BSheetItemWidget extends StatelessWidget {
  BSheetItemWidget(
      {Key? key,
      this.leading,
      required this.title,
      required this.onTap,
      this.trailing,
      this.haveLeading,
      this.haveTrailing})
      : super(key: key);
  final Widget? leading;
  final String title;
  final void Function() onTap;
  final Widget? trailing;
  bool? haveLeading = false, haveTrailing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        margin: const EdgeInsets.only(bottom: 6),
        decoration: AppDecorations.defDecor,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            haveLeading == true
                ? Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: leading,
                  )
                : haveLeading == false
                    ? Container(
                        width: 18,
                        height: 18,
                        margin: const EdgeInsets.only(right: 12.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.metalColor.shade30))
                    : Container(),
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.b5DemiBold,
              ),
            ),
            haveTrailing == true
                ? Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: trailing ?? Container(),
                  )
                : haveTrailing == false
                    ? RotatedBox(
                        quarterTurns: 2,
                        child: SvgPicture.asset(
                          Assets.icons.backArrow,
                          color: AppColors.metalColor.shade90,
                          height: 16,
                        ))
                    : Container()
          ],
        ),
      ),
    );
  }
}
