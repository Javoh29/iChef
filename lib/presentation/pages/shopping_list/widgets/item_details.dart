import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ichef/presentation/pages/shopping_list/widgets/shipping_model.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

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
  late Timer timer;
  int count = 1;
  late ShippingModel deletedItem;
  var maskFormatter = MaskTextInputFormatter(mask: '##');
  List<ShippingModel> modelList = [];
  List<ShippingModel> deletedItems = [];

  @override
  void initState() {
    counterController.text = '1';
    modelList = widget.shippingList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 5),
      itemCount: modelList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => SlidableAutoCloseBehavior(
        closeWhenOpened: true,
        child: Slidable(
          key: ObjectKey(modelList[index]),
          direction: Axis.horizontal,
          startActionPane: ActionPane(
            extentRatio: 0.185,
            motion: const BehindMotion(),
            dragDismissible: false,
            children: [
              InkWell(
                onTap: () {},
                borderRadius:
                    const BorderRadius.horizontal(left: Radius.circular(10)),
                child: Container(
                  width: 60,
                  height: 87,
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight.shade100,
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(10),
                    ),
                  ),
                  child: SvgPicture.asset(
                    Assets.icons.check,
                    fit: BoxFit.none,
                    height: 18,
                    width: 18,
                  ),
                ),
              ),
            ],
          ),
          // closeOnScroll: true,
          endActionPane: ActionPane(
            dragDismissible: true,
            extentRatio: 0.325,
            dismissible: Dismissible(
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  deletedItems.add(modelList.removeAt(modelList[index].id));
                  modelList.addAll(deletedItems);
                  modelList[index].isDeleted = true;
                  deletedItems.clear();
                  debugPrint('$modelList');
                });
              },
              key: ObjectKey(modelList[index]),
              child: Container(
                width: 60,
                height: 87,
                decoration: const BoxDecoration(
                  color: AppColors.accentLight,
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(10),
                  ),
                ),
                child: Row(
                  children: [
                    const Spacer(),
                    Text(
                      'Удалить',
                      style: AppTextStyles.b4DemiBold
                          .copyWith(color: AppColors.baseLight.shade100),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SvgPicture.asset(Assets.icons.delete),
                    ),
                  ],
                ),
              ),
            ),
            motion: const BehindMotion(),
            children: [
              InkWell(
                onTap: () async {},
                borderRadius:
                    const BorderRadius.horizontal(right: Radius.circular(10)),
                child: Container(
                  width: 60,
                  height: 87,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight.shade100,
                  ),
                  child: SvgPicture.asset(
                    Assets.icons.edit,
                    fit: BoxFit.none,
                    height: 18,
                    width: 18,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {});
                  deletedItems.add(modelList.removeAt(index));
                  modelList.addAll(deletedItems);
                  modelList[index].isDeleted = true;
                  deletedItems.clear();
                  debugPrint('$modelList');
                },
                borderRadius:
                    const BorderRadius.horizontal(right: Radius.circular(10)),
                child: Container(
                  width: 60,
                  height: 87,
                  decoration: const BoxDecoration(
                      color: AppColors.accentLight,
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(10))),
                  child: SvgPicture.asset(
                    Assets.icons.delete,
                    fit: BoxFit.none,
                    height: 18,
                    width: 18,
                  ),
                ),
              ),
            ],
          ),
          child: Container(
            alignment: Alignment.center,
            // height: 66,
            padding: EdgeInsets.only(
                left: 10,
                bottom: modelList[index].subTitle != null ? 6 : 0,
                right: 10),
            decoration: modelList[index].isDeleted
                ? AppDecorations.defDecor.copyWith(color: AppColors.deletedItem)
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
                              color: modelList[index].isDeleted
                                  ? AppColors.deletedItemBorder
                                  : AppColors.primaryLight.shade100,
                              width: 1),
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
                            style: AppTextStyles.b4Regular
                                .copyWith(color: AppColors.metalColor.shade50)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
