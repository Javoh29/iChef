import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ichef/config/constants/app_colors.dart';
import 'package:ichef/presentation/pages/shopping_list/components/shipping_model.dart';

import '../../../../config/constants/app_decorations.dart';
import '../../../../config/constants/app_text_styles.dart';
import '../../../../config/constants/assets.dart';
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
        Container(
          margin: const EdgeInsets.only(top: 15),
          child: DottedBorder(
            color: AppColors.primaryLight,
            dashPattern: const [2, 2],
            radius: const Radius.circular(10),
            borderType: BorderType.RRect,
            child: TextButton(
              onPressed: () {},
              style: AppDecorations.buttonStyle(
                bgColor: AppColors.baseLight.shade100,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(Assets.icons.addOutlined),
                  const SizedBox(width: 5),
                  Text(
                    'Новый ингредиент',
                    style: AppTextStyles.b4Medium.copyWith(
                      color: AppColors.primaryLight,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<ShippingModel> list = [
    ShippingModel(isDeleted: false, title: 'Соль', count: 10, price: 129, weight: 34, subTitle: 'C0', id: 1),
    ShippingModel(isDeleted: false, title: 'Корица', count: 10, price: 129, weight: 34, id: 1),
    ShippingModel(isDeleted: false, title: 'Соль', count: 10, price: 129, weight: 34, id: 1),
    ShippingModel(isDeleted: false, title: 'Корица', count: 10, price: 129, weight: 34, id: 1),
    ShippingModel(isDeleted: false, title: 'Соль', count: 10, price: 129, weight: 34, id: 1),
  ];
}
