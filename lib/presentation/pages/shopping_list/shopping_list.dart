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
      body: NestedScrollView(
        physics: const NeverScrollableScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [appBar(innerBoxIsScrolled)];
        },
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: const [
                  ListTileTheme(
                    data: ListTileThemeData(dense: true),
                    child: ShoppingListItem(
                      title:
                          'Пицца с куриными колбасками, ветчиной, гриб...Пицца с куриными колбасками, ветчиной, гриб...',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.baseLight.shade100,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    height: 50,
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

  SliverAppBar appBar(bool innerBoxIsScrolled) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      floating: true,
      forceElevated: innerBoxIsScrolled,
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          Assets.icons.icBack,
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
              Assets.icons.icScanner,
              height: 24,
            ),
          ),
        ),
      ],
      bottom: const ShoppingListAppBar(),
    );
  }
}

// ignore: must_be_immutable
class ShoppingListAppBar extends StatefulWidget implements PreferredSizeWidget {
  const ShoppingListAppBar({Key? key}) : super(key: key);

  @override
  State<ShoppingListAppBar> createState() => _ShoppingListAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class _ShoppingListAppBarState extends State<ShoppingListAppBar> {
  String? _dropdownValue = 'По рецепту';
  var items = [
    'По рецепту',
    '2',
    '3',
    '4',
    '5',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecorations.defDecor,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
      child: Row(
        children: [
          Text(
            'Сортировка',
            style: AppTextStyles.b4Regular.copyWith(color: AppColors.metalColor.shade40),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: DropdownButton<String>(
              isExpanded: true,
              underline: const SizedBox(),
              value: _dropdownValue,
              isDense: true,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items.map((String item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    style: AppTextStyles.b4DemiBold,
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _dropdownValue = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
