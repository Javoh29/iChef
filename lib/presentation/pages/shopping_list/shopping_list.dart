import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ichef/presentation/pages/shopping_list/widgets/shopping_list_item.dart';

import '../../../config/constants/app_colors.dart';
import '../../../config/constants/app_decorations.dart';
import '../../../config/constants/app_text_styles.dart';
import '../../../config/constants/assets.dart';

class ShoppingListPage extends StatefulWidget {
  const ShoppingListPage({Key? key}) : super(key: key);

  @override
  State<ShoppingListPage> createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Шопинг лист',
          style: AppTextStyles.h1.copyWith(fontSize: 14),
        ),
        elevation: 0,
        leading: IconButton(
            onPressed: () {}, icon: SvgPicture.asset(Assets.icons.icBack)),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (context, index) => const ListTileTheme(
              data: ListTileThemeData(dense: true),
              child: ShoppingListItem(
                price: 467,
                title: 'Борщ',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: AppColors.baseLight.shade100,
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, -1),
                      color: Colors.grey,
                      blurRadius: 5,
                      spreadRadius: 1)
                ],
                borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
            child: ElevatedButton(
              onPressed: () {},
              style: AppDecorations.buttonStyle(),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '30-40 мин',
                      style: AppTextStyles.b4Regular
                          .copyWith(color: AppColors.baseLight.shade100),
                    ),
                    Text(
                      'Заказать доставку',
                      style: AppTextStyles.h7
                          .copyWith(color: AppColors.baseLight.shade100),
                    ),
                    Text(
                      '687 р.',
                      style: AppTextStyles.b4Regular
                          .copyWith(color: AppColors.baseLight.shade100),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

