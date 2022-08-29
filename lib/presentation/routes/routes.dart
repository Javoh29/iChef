import 'package:flutter/material.dart';
import 'package:ichef/presentation/pages/home/recipe_info_page.dart';
import 'package:ichef/presentation/pages/home/recipe_step_page.dart';
import 'package:ichef/presentation/pages/main/main_page.dart';
import 'package:ichef/presentation/pages/settings/user_prefrences_page.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../pages/calendar/generation_menu_page.dart';
import '../pages/home/dish_replacement_page.dart';

class Routes {
  static const main = '/';
  static const recipeInfoPage = '/recipeInfoPage';
  static const recipeStepPage = '/recipeStepPage';
  static const userPrefrencesPage = '/userPrefrencesPage';
  static const generationMenuPage = '/generationMenuPage';
  static const dishReplaceMentPage = '/dishReplaceMentPage';
  

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
          return MaterialWithModalsPageRoute(
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
          case recipeStepPage:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => RecipeStep(
              currentStep: args?['currentStep'],
              stepsLength: args?['stepsLength'],
            ),
          );
          case dishReplaceMentPage:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => const DishReplaceMentPage(),
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
