import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ichef/presentation/pages/shopping_list/widgets/shipping_model.dart';
import 'package:ichef/presentation/pages/shopping_list/widgets/slidable_btn.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_decorations.dart';
import '../../../../config/constants/app_text_styles.dart';
import '../../../../config/constants/assets.dart';

class ShoppingItemDetails extends StatefulWidget {
  const ShoppingItemDetails({Key? key, required this.shippingList})
      : super(key: key);
  final List<ShippingModel> shippingList;

  @override
  State<ShoppingItemDetails> createState() => _ShoppingItemDetailsState();
}

class _ShoppingItemDetailsState extends State<ShoppingItemDetails> {
  TextEditingController counterController = TextEditingController();
  List<ShippingModel> modelList = [];
  late ShippingModel model;

  @override
  void initState() {
    counterController.text = '1';
    modelList = widget.shippingList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        widget.shippingList.length,
        (index) => Container(
          margin: const EdgeInsets.only(bottom: 5),
          child: SlidableAutoCloseBehavior(
            closeWhenOpened: true,
            child: Slidable(
              closeOnScroll: true,
              direction: Axis.horizontal,
              key: UniqueKey(),
              startActionPane: ActionPane(
                extentRatio: 0.165,
                motion: const BehindMotion(),
                children: [
                  SlidableBtnWidget(
                    color: AppColors.primaryLight.shade100,
                    icon: Assets.icons.check,
                    leftRadius: 10,
                    rightRadius: 0,
                    onTap: () {},
                  ),
                ],
              ),
              endActionPane: ActionPane(
                extentRatio: 0.325,
                dragDismissible: true,
                motion: const ScrollMotion(),
                dismissible: DismissiblePane(
                  closeOnCancel: true,
                  confirmDismiss: () async => true,
                  onDismissed: () {
                    setState(() {
                      model = modelList.removeAt(index);
                      model.isDeleted = true;
                      modelList.add(model);
                    });
                  },
                ),
                children: [
                  SlidableBtnWidget(
                    leftRadius: 0,
                    rightRadius: 0,
                    color: AppColors.primaryLight.shade100,
                    icon: Assets.icons.edit,
                    onTap: () {},
                  ),
                  SlidableBtnWidget(
                    leftRadius: 0,
                    rightRadius: 10,
                    color: AppColors.accentLight,
                    icon: Assets.icons.trash,
                    onTap: () {
                      setState(() {});
                      model = modelList.removeAt(index);
                      model.isDeleted = true;
                      modelList.add(model);
                    },
                  ),
                ],
              ),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: modelList[index].subTitle != null ? 6 : 0,
                ),
                decoration: modelList[index].isDeleted
                    ? AppDecorations.defDecor
                        .copyWith(color: AppColors.deletedItem)
                    : AppDecorations.defDecor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton(
                            onPressed: () {},
                            style: AppDecorations.buttonStyle(
                              bgColor: modelList[index].isDeleted
                                  ? AppColors.deletedItem
                                  : AppColors.primaryLight.shade50,
                              border: BorderSide(
                                width: 1,
                                color: modelList[index].isDeleted
                                    ? AppColors.deletedItemBorder
                                    : AppColors.primaryLight.shade100,
                              ),
                            ),
                            child: Text(
                              modelList[index].title,
                              style: AppTextStyles.b4Medium.copyWith(
                                color: modelList[index].isDeleted
                                    ? AppColors.deletedItemBorder
                                    : AppColors.primaryLight.shade100,
                              ),
                            ),
                          ),
                          modelList[index].subTitle != null
                              ? Text(
                                  '${modelList[index].subTitle}',
                                  style: AppTextStyles.b4Regular.copyWith(
                                      color: AppColors.metalColor.shade50),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('${modelList[index].weight} г',
                            style: AppTextStyles.b4DemiBold),
                        Row(
                          children: [
                            Text(
                                '${modelList[index].price} р, ${modelList[index].count} шт',
                                style: AppTextStyles.b4Regular.copyWith(
                                    color: AppColors.metalColor.shade50)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}