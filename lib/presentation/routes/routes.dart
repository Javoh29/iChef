import 'package:flutter/material.dart';
import 'package:ichef/presentation/pages/home/profile_page.dart';
import 'package:ichef/presentation/pages/home/recipe_info_page.dart';
import 'package:ichef/presentation/pages/home/recipe_step_page.dart';
import 'package:ichef/presentation/pages/main/main_page.dart';
import 'package:ichef/presentation/pages/product/product_sale_page.dart';
import 'package:ichef/presentation/pages/product/product_without_image_page.dart';
import 'package:ichef/presentation/pages/settings/user_prefrences_page.dart';
import 'package:ichef/presentation/pages/shopping_list/shopping_list.dart';
import 'package:ichef/presentation/pages/splash/splash_page.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../pages/calendar/generation_menu_page.dart';
import '../pages/home/recipe_replace_page.dart';
import '../pages/oil_info/oil_info_page.dart';

class Routes {
  static const splashPage = '/';
  static const mainPage = '/mainPage';
  static const homePage = '/homePage';
  static const recipeInfoPage = '/recipeInfoPage';
  static const recipeStepPage = '/recipeStepPage';
  static const userPrefrencesPage = '/userPrefrencesPage';
  static const generationMenuPage = '/generationMenuPage';
  static const shoppingListPage = '/shoppingListPage';
  static const recipeReplacePage = '/recipeReplacePage';
  static const productPage = '/productPage';
  static const oilPage = '/oilPage';
  static const profilePage = '/profilePage';
  static const productSalePage = '/productSalePage';
  static const productWithoutImagePage = '/profileWithoutImagePage';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    try {
      final Map<String, dynamic>? args = routeSettings.arguments as Map<String, dynamic>?;
      args ?? <String, dynamic>{};
      switch (routeSettings.name) {
        case splashPage:
          return MaterialWithModalsPageRoute(
            settings: routeSettings,
            builder: (_) => const SplashPage(),
          );
        case mainPage:
          return MaterialWithModalsPageRoute(
            settings: routeSettings,
            builder: (_) => const MainPage(),
          );
        case recipeInfoPage:
          return MaterialWithModalsPageRoute(
            settings: routeSettings,
            builder: (_) => RecipeInfoPage(
              model: args?['recipe_model'],
              seekToTime: args?['seek_to_time'],
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
              model: args?['recipeModel'],
              seekToTime: args?['seekToTime'],
            ),
          );
        case recipeReplacePage:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => const RecipeReplacePage(),
          );
        case shoppingListPage:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => const ShoppingListPage(),
          );
        // case productPage:
        //   return MaterialPageRoute(
        //     settings: routeSettings,
        //     builder: (_) => const ProductInfoPage(
        //       productModel: ,
        //     ),
        //   );
        case oilPage:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => const OilInfoPage(),
          );

        case productSalePage:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => const ProductSalePage(),
          );

        case productWithoutImagePage:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => const ProductWithoutImagePage(),
          );

        case profilePage:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => const ProfilePage(),
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
