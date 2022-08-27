import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ichef/config/theme/themes.dart';
import 'package:ichef/presentation/pages/shopping_list/shopping_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark));
    return MaterialApp(title: 'Flutter Demo', theme: Themes.lightTheme, home: const ShoppingListPage()
        // const MainPage(),
        );
  }
}
