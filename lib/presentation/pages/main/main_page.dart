import 'package:flutter/material.dart';
import 'package:ichef/config/constants/local_data.dart';
import 'package:ichef/presentation/pages/favorites/favorites_page.dart';
import 'package:ichef/presentation/pages/home/home_scope.dart';
import 'package:ichef/presentation/pages/recipes/recipes_page.dart';
import 'package:ichef/presentation/pages/shopping_list/shopping_scope.dart';
import 'package:ichef/presentation/routes/routes.dart';
import 'package:ichef/presentation/widgets/filter_drawer_widget.dart';

import '../../components/bottom_nav_bar.dart';
import '../../components/user_info_bottom_sheet.dart';
import '../calendar/calendar_page.dart';
import '../shopping_list/shopping_list.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController();
  final GlobalKey<ScaffoldState> _keyScaffold = GlobalKey();
  late final List<Widget> pages = [
    HomeScope(openFilter: () {
      _keyScaffold.currentState?.openEndDrawer();
    }),
    const RecipesPage(),
    const FavoritesPage(),
    const CalendarPage(),
    ShoppingScope(),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _keyScaffold,
      endDrawer: const FilterDrawerWidget(),
      endDrawerEnableOpenDragGesture: false,
      body: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: pages,
            onPageChanged: (index) {
              setState(() {});
            },
          ),
          BottomNavBar(
            selectedIndex: _selectedIndex,
            onTap: (index) {
              // if (index == 4) {
              //   Navigator.pushNamed(context, Routes.shoppingListPage);
              // }
              if (index == 5) {
                userInfoBottomSheet(context, users.first);
              } else {
                _selectedIndex = index;
                _pageController.jumpToPage(index);
              }
            },
          ),
        ],
      ),
    );
  }
}
