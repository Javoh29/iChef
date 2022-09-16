import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ichef/config/constants/app_colors.dart';
import 'package:ichef/config/constants/app_text_styles.dart';
import 'package:ichef/config/constants/assets.dart';
import 'package:ichef/config/constants/local_data.dart';
import 'package:ichef/data/models/recipe_model.dart';
import 'package:ichef/presentation/pages/home/recipes_tab_page.dart';
import 'package:ichef/presentation/widgets/drawer_widget.dart';

import '../../components/custom_badge.dart';
import 'chat_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({required this.openFilter, Key? key}) : super(key: key);
  final Function() openFilter;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late final TabController _tabController = TabController(length: 3, vsync: this);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _tabController.addListener(() => setState(() {}));
  }
  
  RecipeModel model = RecipeModel(recipeSteps: recipeSteps, userComment: userComments, drawer: nejnayaDrawerModel);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: IngredientsDrawer(
        model: model,
      ),
      endDrawerEnableOpenDragGesture: false,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        physics: const NeverScrollableScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            appBar(innerBoxIsScrolled),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            RecipesTabPage(
              callBack: (index) {
                setState(() {
                  model = listRecipes[index];
                });
                _scaffoldKey.currentState?.openEndDrawer();
              },
            ),
            Container(),
            const ChatPage(),
          ],
        ),
      ),
    );
  }

  SliverAppBar appBar(bool innerBoxIsScrolled) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      snap: true,
      floating: true,
      pinned: true,
      forceElevated: innerBoxIsScrolled,
      actions: const [SizedBox.shrink()],
      centerTitle: false,
      title: Column(
        children: [
          Row(children: [
            const Flexible(
                child: CupertinoSearchTextField(
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 5, top: 5, right: 5),
                child: Icon(CupertinoIcons.search),
              ),
            )),
            IconButton(
              onPressed: widget.openFilter,
              icon: SvgPicture.asset(
                Assets.icons.filter,
                height: 22,
                width: 22,
              ),
            )
          ]),
        ],
      ),
      bottom: tabBar(),
    );
  }

  TabBar tabBar() {
    return TabBar(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      controller: _tabController,
      labelStyle: AppTextStyles.b3Medium,
      unselectedLabelStyle: AppTextStyles.b5Medium,
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
