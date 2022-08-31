import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ichef/presentation/pages/shopping_list/components/shopping_list_app_bar.dart';
import 'package:ichef/presentation/pages/shopping_list/components/shopping_list_item.dart';
import 'package:ichef/presentation/pages/shopping_list/components/sliver_app_bar_widget.dart';

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
      body: NestedScrollView(
        physics: const NeverScrollableScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBarWidget(
              innerBoxIsScrolled: innerBoxIsScrolled,
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: SvgPicture.asset(
                  Assets.icons.back,
                  height: 20,
                ),
              ),
              title: Text(
                'Шопинг лист',
                style: AppTextStyles.h1.copyWith(fontSize: 14),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      Assets.icons.scanner,
                      height: 24,
                    ),
                  ),
                ),
              ],
              bottom: const ShoppingListAppBar(),
            ),
          ];
        },
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ShoppingListItem(
                title:
                    'Пицца с куриными колбасками, ветчиной, гриб...Пицца с куриными колбасками, ветчиной, гриб...',
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: AppColors.baseLight.shade100),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 50,
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: TextButton(
                      onPressed: () {},
                      style: AppDecorations.buttonStyle(borderRadius: 12),
                      child: Text(
                        'Заказать доставку',
                        style: AppTextStyles.h7.copyWith(color: AppColors.baseLight.shade100),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
