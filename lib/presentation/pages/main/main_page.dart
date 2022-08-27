import 'package:flutter/material.dart';
import 'package:ichef/presentation/pages/calendar/calendar_page.dart';
import 'package:ichef/presentation/pages/cart/cart_page.dart';
import 'package:ichef/presentation/pages/favorites/favorites_page.dart';
import 'package:ichef/presentation/pages/home/home_page.dart';
import 'package:ichef/presentation/pages/recipes/recipes_page.dart';
import 'package:ichef/presentation/pages/search/search_page.dart';
import 'package:ichef/presentation/pages/settings/settings_page.dart';
import 'package:ichef/presentation/widgets/drawer_widget.dart';

import '../../components/bottom_nav_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController();
  final List<Widget> pages = [
    const HomePage(),
    const RecipesPage(),
    const FavoritesPage(),
    const CalendarPage(),
    const CartPage(),
    const SettingsPage()
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const IngredientsDrawer(),
      endDrawerEnableOpenDragGesture: false,
      body: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: pages,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          BottomNavBar(
            selectedIndex: _selectedIndex,
            onTap: (index) => _pageController.jumpToPage(index),
          ),
        ],
      ),
    );
  }
}
