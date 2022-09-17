import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ichef/presentation/pages/home/recipe_info_page.dart';
import 'package:ichef/presentation/pages/oil_info/oil_info_page.dart';
import 'package:ichef/presentation/pages/shopping_list/shopping_list.dart';
import 'package:ichef/presentation/routes/routes.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../product/product_sale_page.dart';
import '../product/product_without_image_page.dart';

class ShoppingScope extends StatelessWidget {
  ShoppingScope({Key? key}) : super(key: key);

  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (navigatorKey.currentState!.canPop()) {
          navigatorKey.currentState!.pop(navigatorKey.currentContext);
          return SynchronousFuture(false);
        } else {
          return SynchronousFuture(true);
        }
      },
      child: Navigator(
        key: navigatorKey,
        onGenerateRoute: (RouteSettings settings) {
          final Map<String, dynamic>? args =
              settings.arguments as Map<String, dynamic>?;
          args ?? <String, dynamic>{};
          return MaterialWithModalsPageRoute(
              settings: settings,
              builder: (BuildContext context) {
                switch (settings.name) {
                  case Routes.recipeInfoPage:
                    return RecipeInfoPage(
                      model: args?['recipe_model'],
                      seekToTime: args?['seek_to_time'],
                      callBack: () {},
                    );
                  case Routes.shoppingListPage:
                    return const ShoppingListPage();
                  case Routes.oilPage:
                    return const OilInfoPage();
                  case Routes.productWithoutImagePage:
                    return const ProductWithoutImagePage();
                  case Routes.productSalePage:
                    return const ProductSalePage();
                  default:
                    return const ShoppingListPage();
                }
              });
        },
      ),
    );
  }
}
