import 'package:flutter/material.dart';
import 'package:ichef/presentation/pages/shopping_list/widgets/shipping_model.dart';

import '../../../../config/constants/app_text_styles.dart';
import 'item_details.dart';

class ShoppingListItem extends StatefulWidget {
  const ShoppingListItem({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  State<ShoppingListItem> createState() => _ShoppingListItemState();
}

class _ShoppingListItemState extends State<ShoppingListItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            widget.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.h1.copyWith(fontSize: 14),
          ),
        ),
        ShoppingItemDetails(shippingList: list),
      ],
    );
  }

  List<ShippingModel> list = [
    ShippingModel(
        isDeleted: false,
        title: 'Соль',
        count: 10,
        price: 129,
        weight: 34,
        subTitle: 'fhdkslafhdlsakjfhdaslkjfhdslkf',
        id: 1),
    ShippingModel(
        isDeleted: false,
        title: 'Корица',
        count: 10,
        price: 129,
        weight: 34,
        id: 1),
    ShippingModel(
        isDeleted: false,
        title: 'Соль',
        count: 10,
        price: 129,
        weight: 34,
        id: 1),
    ShippingModel(
        isDeleted: false,
        title: 'Корица',
        count: 10,
        price: 129,
        weight: 34,
        id: 1),
    ShippingModel(
        isDeleted: false,
        title: 'Соль',
        count: 10,
        price: 129,
        weight: 34,
        id: 1),
  ];
}
