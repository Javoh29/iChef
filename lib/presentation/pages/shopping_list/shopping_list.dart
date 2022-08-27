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
  String dropdownValue = 'По рецепту';
  var items = [
    'По рецепту',
    '2',
    '3',
    '4',
    '5',
  ];

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
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20, bottom: 10, top: 10),
              child: GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(Assets.icons.icScanner),
              )),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Container(
            decoration: AppDecorations.defDecor,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  'Сортировка',
                  style: AppTextStyles.b4Regular
                      .copyWith(color: AppColors.metalColor.shade40),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    underline: const SizedBox(),
                    value: dropdownValue,
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
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue ?? '';
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (context, index) => const ListTileTheme(
              data: ListTileThemeData(dense: true),
              child: ShoppingListItem(
                title: 'Пицца с куриными колбасками, ветчиной, гриб...Пицца с куриными колбасками, ветчиной, гриб...',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.baseLight.shade100,
            ),
            // boxShadow: const [
            //   BoxShadow(
            //       offset: Offset(0, -1),
            //       color: Colors.grey,
            //       blurRadius: 5,
            //       spreadRadius: 1)
            // ],
            // borderRadius: const BorderRadius.vertical(top: Radius.circular(30))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ElevatedButton(
                //   onPressed: () {},
                //   style: AppDecorations.buttonStyle(),
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(vertical: 10.0),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                //       children: [
                //         // Text(
                //         //   '30-40 мин',
                //         //   style: AppTextStyles.b4Regular
                //         //       .copyWith(color: AppColors.baseLight.shade100),
                //         // ),
                //         Text(
                //           'Заказать доставку',
                //           style: AppTextStyles.h7
                //               .copyWith(color: AppColors.baseLight.shade100),
                //         ),
                //         // Text(
                //         //   '687 р.',
                //         //   style: AppTextStyles.b4Regular
                //         //       .copyWith(color: AppColors.baseLight.shade100),
                //         // ),
                //       ],
                //     ),
                //   ),
                // ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: AppDecorations.buttonStyle(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Text(
                        //   '30-40 мин',
                        //   style: AppTextStyles.b4Regular
                        //       .copyWith(color: AppColors.baseLight.shade100),
                        // ),
                        Text(
                          'Заказать доставку',
                          style: AppTextStyles.h7
                              .copyWith(color: AppColors.baseLight.shade100),
                        ),
                        // Text(
                        //   '687 р.',
                        //   style: AppTextStyles.b4Regular
                        //       .copyWith(color: AppColors.baseLight.shade100),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
