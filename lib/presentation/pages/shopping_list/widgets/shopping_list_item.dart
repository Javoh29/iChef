import 'package:flutter/material.dart';

import '../../../../config/constants/app_text_styles.dart';
import 'item_details.dart';

class ShoppingListItem extends StatelessWidget {
  const ShoppingListItem({
    Key? key,
    required this.title,
    required this.price,
  }) : super(key: key);
  final String title;
  final int price;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Row(
        children: [
          Text(
            title,
            style: AppTextStyles.h1.copyWith(fontSize: 14),
          ),
          const SizedBox(width: 6),
          Text("$price р", style: AppTextStyles.b4Regular),
        ],
      ),
      tilePadding: EdgeInsets.zero,
      childrenPadding: EdgeInsets.zero,
      children: [
        ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return const ShoppingItemDetails(
              image: 'assets/images/borsh.png',
              title: 'Пшеничная мука',
              subTitle: 'Manitoba 400',
              price: 69,
              weight: 400,
            );
          },
        )
      ],
    );
  }
}
