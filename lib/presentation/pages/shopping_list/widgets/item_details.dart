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
    return ListView.builder(
      itemCount: modelList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => SlidableAutoCloseBehavior(
        child: Slidable(
          key: Key('${modelList[index].id}'),
          direction: Axis.horizontal,
          startActionPane: ActionPane(
            extentRatio: 0.185,
            motion: const BehindMotion(),
            dragDismissible: false,
            children: [
              InkWell(
                onTap: () {},
                borderRadius:
                    const BorderRadius.horizontal(right: Radius.circular(10)),
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
          closeOnScroll: true,
          endActionPane: ActionPane(
            extentRatio: 0.35,
            dismissible: Dismissible(
              onDismissed: (direction) {
                // modelList.removeAt(index);
                // deletedItem = modelList.elementAt(index);
                // modelList.removeAt(index);
                deletedItems.add(modelList.removeAt(index));
                modelList.addAll(deletedItems);
                modelList[index].isDeleted = true;
                setState(() {});
              },
              direction: DismissDirection.vertical,
              key: ValueKey(modelList[index].id),
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
            dragDismissible: true,
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
                  // modelList.removeAt(index);
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
            margin: const EdgeInsets.only(bottom: 5),
            decoration: modelList[index].isDeleted
                ? AppDecorations.defDecor.copyWith(color: Colors.red)
                : AppDecorations.defDecor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // widget.image != null
                //     ? Container(
                //         height: 36,
                //         width: 36,
                //         margin: EdgeInsets.only(right: 10),
                //         decoration: const BoxDecoration(shape: BoxShape.circle),
                //         child: ClipRRect(
                //             borderRadius: BorderRadius.circular(50),
                //             child: Image.asset('${widget.image}', fit: BoxFit.cover)))
                //     : Container(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: AppDecorations.buttonStyle(
                          bgColor: AppColors.primaryLight.shade50,
                          border: BorderSide(
                              color: AppColors.primaryLight.shade100, width: 1),
                        ),
                        child: Text(
                          modelList[index].title,
                          style: AppTextStyles.b4Medium.copyWith(
                            color: AppColors.primaryLight.shade100,
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
                      // Text(
                      //   widget.subTitle,
                      //   style: AppTextStyles.b4Regular
                      //       .copyWith(color: AppColors.metalColor.shade50),
                      // ),
                      // Text('${widget.price} р', style: AppTextStyles.b4DemiBold),
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
                        // Text(
                        //   widget.subTitle,
                        //   style: AppTextStyles.b4Regular
                        //       .copyWith(color: AppColors.metalColor.shade50),
                        // ),
                      ],
                    ),
                  ],
                ),
                // Container(
                //   height: 28,
                //   padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 3),
                //   decoration: BoxDecoration(
                //       color: const Color(0xffE5E7EB),
                //       borderRadius: BorderRadius.circular(6)),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       GestureDetector(
                //         onTap: () {
                //           FocusManager.instance.primaryFocus?.unfocus();
                //           onTapInOrDecrement(isInc: false);
                //         },
                //         onTapDown: (TapDownDetails details) {
                //           FocusManager.instance.primaryFocus?.unfocus();
                //           FocusManager.instance.primaryFocus?.unfocus();
                //
                //           timer =
                //               Timer.periodic(const Duration(milliseconds: 100), (t) {
                //             if (count > 1) {
                //               if (counterController.text.isEmpty) {
                //                 count = 0;
                //               } else {
                //                 count = int.parse(counterController.text);
                //               }
                //               if (count > 1) {
                //                 count--;
                //               }
                //               counterController.text = count.toString();
                //               // b = personCount.toString();
                //             }
                //           });
                //         },
                //         onTapUp: (TapUpDetails details) => timer.cancel(),
                //         onTapCancel: () => timer.cancel(),
                //         child: SvgPicture.asset(Assets.icons.icRemoveBlack,
                //             color: AppColors.metalColor.shade100),
                //       ),
                //       Container(
                //         width: 20,
                //         alignment: Alignment.center,
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(25),
                //         ),
                //         margin: const EdgeInsets.symmetric(horizontal: 10),
                //         child: TextFormField(
                //           inputFormatters: [maskFormatter],
                //           cursorColor: Colors.black,
                //           textAlign: TextAlign.center,
                //           controller: counterController,
                //           style: AppTextStyles.b3DemiBold.copyWith(fontSize: 12),
                //           maxLines: 1,
                //           keyboardType: TextInputType.number,
                //           decoration: const InputDecoration(border: InputBorder.none),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {
                //           FocusManager.instance.primaryFocus?.unfocus();
                //           onTapInOrDecrement(isInc: true);
                //         },
                //         onTapDown: (TapDownDetails details) {
                //           FocusManager.instance.primaryFocus?.unfocus();
                //           timer = Timer.periodic(
                //             const Duration(milliseconds: 100),
                //             (t) => setState(
                //               () {
                //                 if (counterController.text.isEmpty) {
                //                   count = 0;
                //                 } else {
                //                   count = int.parse(counterController.text);
                //                 }
                //                 count++;
                //                 counterController.text = count.toString();
                //                 // initialBlok = personCount.toString();
                //               },
                //             ),
                //           );
                //         },
                //         onTapUp: (TapUpDetails details) => timer.cancel(),
                //         onTapCancel: () => timer.cancel(),
                //         child: SvgPicture.asset(Assets.icons.icAddBlack,
                //             color: AppColors.metalColor.shade100),
                //       ),
                //       // const SizedBox(width: 25)
                //     ],
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onTapInOrDecrement({required bool isInc}) {
    if (isInc) {
      setState(() {
        if (counterController.text.isEmpty) {
          count = 0;
        } else {
          count = int.parse(counterController.text);
        }
        count++;
        counterController.text = count.toString();
      });
    } else {
      setState(() {
        if (counterController.text.isEmpty) {
          count = 0;
        } else {
          count = int.parse(counterController.text);
        }
        if (count > 0) count--;
        counterController.text = count.toString();
      });
    }
  }
}
