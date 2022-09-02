import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ichef/presentation/pages/home/home_page.dart';
import 'package:ichef/presentation/pages/home/profile_page.dart';
import 'package:ichef/presentation/pages/home/recipe_info_page.dart';
import 'package:ichef/presentation/routes/routes.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomeScope extends StatelessWidget {
  HomeScope({required this.openFilter, Key? key}) : super(key: key);
  final Function() openFilter;
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
          final Map<String, dynamic>? args = settings.arguments as Map<String, dynamic>?;
          args ?? <String, dynamic>{};
          return MaterialWithModalsPageRoute(
              settings: settings,
              builder: (BuildContext context) {
                switch (settings.name) {
                  case Routes.recipeInfoPage:
                    return RecipeInfoPage(
                      model: args?['recipe_model'],
                      seekToTime: args?['seek_to_time'],
                    );
                  case Routes.profilePage:
                    return const ProfilePage();
                  default:
                    return HomePage(openFilter: openFilter);
                }
              });
        },
      ),
    );
  }
}
