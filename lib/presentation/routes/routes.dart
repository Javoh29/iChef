import 'package:flutter/material.dart';
import 'package:ichef/presentation/pages/home/recipe_info_page.dart';
import 'package:ichef/presentation/pages/main/main_page.dart';
import 'package:ichef/presentation/pages/settings/user_prefrences_page.dart';

import '../pages/calendar/generation_menu_page.dart';

class Routes {
  static const main = '/';
  static const recipeInfoPage = '/recipeInfoPage';
  static const userPrefrencesPage = '/userPrefrencesPage';
  static const generationMenuPage = '/generationMenuPage';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    try {
      final Map<String, dynamic>? args = routeSettings.arguments as Map<String, dynamic>?;
      args ?? <String, dynamic>{};
      switch (routeSettings.name) {
        case main:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => const MainPage(),
          );
        case recipeInfoPage:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => RecipeInfoPage(
              model: args?['recipe_model'],
            ),
          );
        case userPrefrencesPage:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => const UserPrefrencesPage(),
          );
        case generationMenuPage:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => const GenerationMenuPage(),
          );
        default:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => const MainPage(),
          );
      }
    } catch (e) {
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MainPage(),
      );
    }
  }
}
