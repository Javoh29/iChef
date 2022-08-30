import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config/constants/app_colors.dart';
import '../../../config/constants/app_text_styles.dart';
import '../../../config/constants/assets.dart';
import '../../../config/constants/local_data.dart';
import '../../components/custom_badge.dart';
import '../../components/profile_card.dart';
import '../../components/recipe_item.dart';
import '../../widgets/gradient_avatar_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with TickerProviderStateMixin {
  late final TabController _tabController = TabController(length: 3, vsync: this);

  @override
  void initState() {
    super.initState();
    _tabController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(Assets.icons.bell),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz),
          ),
        ],
      ),
      body: NestedScrollView(
        physics: const NeverScrollableScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              forceElevated: true,
              elevation: 0,
              bottom: MySliver(
                profileTabList: profileTabList,
                userIndex: 0,
              ),
            ),
          ];
        },
        body: Column(
          children: [
            // #tabbar
            TabBar(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              controller: _tabController,
              unselectedLabelStyle: AppTextStyles.b5Regular.copyWith(color: AppColors.metalColor.shade50),
              labelStyle: AppTextStyles.b5Regular.copyWith(color: AppColors.baseLight),
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 4.0, color: AppColors.primaryLight),
              ),
              tabs: List.generate(
                profileTabList.length,
                (index) {
                  return Tab(
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(profileTabList[index]),
                        CustomBadge(
                          text: '24K',
                          isActive: _tabController.index == index,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  myListViews(),
                  myListViews(),
                  myListViews(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView myListViews() {
    return ListView(
      shrinkWrap: true,
      children: [
        // horizontal listview
        horizontalListView(),
        ...List.generate(
          listRecipes.length,
          (index) => RecipeItem(
            model: listRecipes[index],
          ),
        ),
      ],
    );
  }

  Container horizontalListView() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 90,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: List.generate(
          10,
          (index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GradientAvatarWidget(
                  colors: const [
                    Color(0xff2934D0),
                    Color(0xffEB47BD),
                  ],
                  avatarPath: users[0].userImage ?? "",
                  size: 48,
                  borderRadius: 16,
                  margin: const EdgeInsets.only(right: 22, top: 10),
                  badgeText: '7',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    'Сувид',
                    style: AppTextStyles.b4Regular,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class MySliver extends StatelessWidget implements PreferredSizeWidget {
  const MySliver({
    Key? key,
    required this.profileTabList,
    required this.userIndex,
  }) : super(key: key);

  final List profileTabList;
  final int userIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileCard(
          model: users[userIndex],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(140);
}
