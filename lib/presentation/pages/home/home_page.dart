import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ichef/config/constants/app_colors.dart';
import 'package:ichef/config/constants/app_decorations.dart';
import 'package:ichef/config/constants/app_text_styles.dart';
import 'package:ichef/config/constants/assets.dart';
import 'package:ichef/presentation/pages/home/recipes_tab_page.dart';

import '../../components/custom_badge.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late final TabController _tabController = TabController(length: 3, vsync: this);

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
          appBar(innerBoxIsScrolled),
        ];
      },
      body: TabBarView(
        controller: _tabController,
        children: [
          const RecipesTabPage(),
          Container(color: Colors.blue, child: const Center(child: Text('Блоги'))),
          Container(color: Colors.red, child: const Center(child: Text('Чат'))),
        ],
      ),
    );
  }

  SliverAppBar appBar(bool innerBoxIsScrolled) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      floating: true,
      forceElevated: innerBoxIsScrolled,
      actions: const [SizedBox.shrink()],
      centerTitle: false,
      title: Row(children: [
        SvgPicture.asset(
          Assets.icons.appLogo,
          height: 35,
          width: 35,
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Text(
            'iChef Expert',
            style: AppTextStyles.h3.copyWith(fontSize: 22),
          ),
        ),
        TextButton(
          onPressed: () {},
          style: AppDecorations.buttonStyle(padding: const EdgeInsets.symmetric(horizontal: 12)),
          child: Text(
            'Фильтры',
            style: AppTextStyles.b4Medium.copyWith(color: AppColors.baseLight.shade100),
          ),
        )
      ]),
      bottom: tabBar(),
    );
  }

  TabBar tabBar() {
    return TabBar(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      controller: _tabController,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(width: 4.0, color: AppColors.primaryLight),
      ),
      tabs: [
        Tab(
          height: 22,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Рецепты'),
              CustomBadge(
                text: '24K',
                isActive: _tabController.index == 0,
              ),
            ],
          ),
        ),
        Tab(
          height: 22,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Блоги'),
            ],
          ),
        ),
        Tab(
          height: 22,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Чат'),
              CustomBadge(
                text: '194K',
                isActive: _tabController.index == 2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
