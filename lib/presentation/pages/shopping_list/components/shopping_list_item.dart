import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ichef/config/constants/app_colors.dart';
import 'package:ichef/data/models/shopping_list_model.dart';

import '../../../../config/constants/app_decorations.dart';
import '../../../../config/constants/app_text_styles.dart';
import '../../../../config/constants/assets.dart';
import 'item_details.dart';

class ShoppingListItem extends StatefulWidget {
  const ShoppingListItem({
    Key? key,
    required this.sortBy,
  }) : super(key: key);
  final String sortBy;

  @override
  State<ShoppingListItem> createState() => _ShoppingListItemState();
}

class _ShoppingListItemState extends State<ShoppingListItem> {
  bool sort = true;

  @override
  Widget build(BuildContext context) {
    sort = widget.sortBy == 'По рецепту';
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ...List.generate(
                  sort ? poReseptu.length : poOtdelam.length,
                  (index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: Text(
                                    sort
                                        ? poReseptu[index]['title']
                                        : poOtdelam[index]['title'],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        AppTextStyles.h1.copyWith(fontSize: 14),
                                  ),
                                ),
                                sort || index != 4
                                    ? SvgPicture.asset(
                                        Assets.icons.more,
                                        color: AppColors.metalColor,
                                      )
                                    : Container()
                              ],
                            ),
                          ),
                          ShoppingItemDetails(
                              shippingList: sort
                                  ? poReseptu[index]['titleListItems']
                                  : poOtdelam[index]['titleListItems']),
                          (sort
                                  ? poReseptu[index]['subtitle'] != null
                                  : poOtdelam[index]['subtitle'] != null)
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Text(
                                        sort
                                            ? poReseptu[index]['subtitle']
                                            : poOtdelam[index]['subtitle'],
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppTextStyles.b4Regular,
                                      ),
                                    ),
                                    ShoppingItemDetails(
                                      shippingList: sort
                                          ? poReseptu[index]['subtitleList'] ??
                                              []
                                          : poReseptu[index]['subtitleList'] ??
                                              [],
                                    ),
                                  ],
                                )
                              : Container(),
                        ],
                      )),
              Text(
                'Мои покупки',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.h1.copyWith(fontSize: 14),
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 2, right: 2, top: 10, bottom: 45),
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
          ),
        ),
        const SizedBox(height: 90),
      ],
    );
  }
}
