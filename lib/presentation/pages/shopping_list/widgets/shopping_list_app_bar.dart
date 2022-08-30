
// ignore: must_be_immutable
import 'package:flutter/material.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_decorations.dart';
import '../../../../config/constants/app_text_styles.dart';

class ShoppingListAppBar extends StatefulWidget implements PreferredSizeWidget {
  const   ShoppingListAppBar({Key? key}) : super(key: key);

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
