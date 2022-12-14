import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_custom_slidable/action_pane_motions.dart';
import 'package:flutter_custom_slidable/auto_close_behavior.dart';
import 'package:flutter_custom_slidable/slidable.dart';
import 'package:ichef/presentation/pages/shopping_list/components/shipping_model.dart';
import 'package:ichef/presentation/pages/shopping_list/components/slidable_btn.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_decorations.dart';
import '../../../../config/constants/app_text_styles.dart';
import '../../../../config/constants/assets.dart';
import '../../../../config/constants/local_data.dart';
import '../../../routes/routes.dart';
import '../../../widgets/dismissible_panel_widget.dart';
import '../../product/product_info_page.dart';

class ShoppingItemDetails extends StatefulWidget {
  const ShoppingItemDetails({Key? key, required this.shippingList})
      : super(key: key);
  final List<ShippingModel> shippingList;

  @override
  State<ShoppingItemDetails> createState() => _ShoppingItemDetailsState();
}

class _ShoppingItemDetailsState extends State<ShoppingItemDetails> {
  List<ShippingModel> modelList = [];
  late ShippingModel thisModel;

  // late SlidableController _slidableController;

  @override
  void initState() {
    modelList = widget.shippingList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    modelList = widget.shippingList;
    return Column(
      children: List.generate(
        widget.shippingList.length,
        (index) => Container(
          margin: const EdgeInsets.only(bottom: 5),
          child: SlidableAutoCloseBehavior(
            child: Slidable(
                closeOnScroll: true,
                key: UniqueKey(),
                startActionPane: ActionPane(
                  onClose: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      setState(() {});
                      modelList[index].isCheck = !modelList[index].isCheck;
                      if (modelList[index].isCheck) {
                        thisModel = modelList.removeAt(index);
                        modelList.add(thisModel);
                      } else {
                        thisModel = modelList.removeAt(index);
                        modelList.insert(
                            thisModel.id <= index
                                ? thisModel.id
                                : modelList.length - 1,
                            thisModel);
                      }
                    });
                  },
                  key: UniqueKey(),
                  extentRatio: 0.24,
                  openThreshold: 0.9,
                  closeThreshold: 0.9,
                  motion: const BehindMotion(),
                  children: [
                    SlidableBtnWidget(
                      color: AppColors.primaryLight.shade100,
                      icon: Assets.icons.check,
                      leftRadius: 10,
                      rightRadius: 0,
                      onTap: () {
                        setState(() {});
                        modelList[index].isCheck = !modelList[index].isCheck;
                      },
                    ),
                  ],
                ),
                endActionPane: ActionPane(
                  onClose: () {},
                  extentRatio: 0.45,
                  closeThreshold: 0.1,
                  openThreshold: 0.1,
                  motion: const ScrollMotion(),
                  dismissible: DismissiblePaneWidget(
                    closeOnCancel: true,
                    motion: const ScrollMotion(),
                    confirmDismiss: () async => true,
                    dismissThreshold: 0.9,
                    onDismissed: () {
                      setState(() {
                        thisModel = modelList.removeAt(index);
                      });
                    },
                  ),
                  children: [
                    SlidableBtnWidget(
                      leftRadius: 0,
                      rightRadius: 0,
                      color: AppColors.primaryLight.shade100,
                      icon: Assets.icons.edit,
                      onTap: () {
                        setState(() {
                          modelList[index].isShowEdit =
                              !modelList[index].isShowEdit;
                        });
                      },
                    ),
                    SlidableBtnWidget(
                      leftRadius: 0,
                      rightRadius: 10,
                      color: AppColors.accentLight,
                      icon: Assets.icons.trash,
                      onTap: () {
                        setState(() {});
                        thisModel = modelList.removeAt(index);
                      },
                    ),
                  ],
                ),
                child: ItemWidget(
                  model: modelList[index],
                  showEdit: modelList[index].isShowEdit,
                  onTap: () {
                    if (modelList[index].id == 8 || modelList[index].id == 32) {
                      Navigator.pushNamed(context, Routes.oilPage);
                    } else if (modelList[index].id == 19 ||
                        modelList[index].id == 33) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductInfoPage(
                            productModel: model[1],
                          ),
                        ),
                      );
                    }
                  },
                )),
          ),
        ),
      ),
    );
  }
}

class ItemWidget extends StatefulWidget {
  const ItemWidget(
      {Key? key,
      required this.model,
      required this.showEdit,
      required this.onTap})
      : super(key: key);
  final ShippingModel model;
  final bool showEdit;
  final void Function() onTap;

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  Timer? timer;
  int _count = 1;
  BoxDecoration decoration = AppDecorations.defDecor;
  TextEditingController counterController = TextEditingController();
  MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(mask: '##');

  @override
  void initState() {
    counterController.text = '1';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    decoration = widget.model.isCheck
        ? AppDecorations.defDecor.copyWith(color: AppColors.deletedItem)
        : AppDecorations.defDecor;

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: decoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: widget.onTap,
                style: AppDecorations.buttonStyle(
                  bgColor: widget.model.isCheck
                      ? AppColors.deletedItem
                      : AppColors.primaryLight.shade50,
                  border: BorderSide(
                    width: 1,
                    color: widget.model.isCheck
                        ? AppColors.deletedItemBorder
                        : AppColors.primaryLight.shade100,
                  ),
                ),
                child: Text(
                  widget.model.title,
                  style: AppTextStyles.b4Medium.copyWith(
                    color: widget.model.isCheck
                        ? AppColors.deletedItemBorder
                        : AppColors.primaryLight.shade100,
                  ),
                ),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(widget.model.weight ?? '',
                      style: AppTextStyles.b4DemiBold
                          .copyWith(fontWeight: FontWeight.w700)),
                  Row(
                    children: [
                      widget.model.subWeight != null
                          ? Text(
                              '${widget.model.subWeight}',
                              style: AppTextStyles.b4DemiBold.copyWith(
                                color: AppColors.metalColor.shade50,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ],
              ),
              widget.showEdit
                  ? Container(
                      height: 28,
                      margin: const EdgeInsets.only(left: 12),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 3),
                      decoration: BoxDecoration(
                          color: const Color(0xffE5E7EB),
                          borderRadius: BorderRadius.circular(6)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          btnIncOrDec(
                              icon: Assets.icons.removeBlack, isInc: false),
                          Container(
                            width: 20,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextFormField(
                              inputFormatters: [maskFormatter],
                              cursorColor: Colors.black,
                              textAlign: TextAlign.center,
                              controller: counterController,
                              style: AppTextStyles.b5DemiBold,
                              maxLines: 1,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          btnIncOrDec(icon: Assets.icons.addBlack),
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
          widget.model.subTitle != null
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: Text(
                    '${widget.model.subTitle}',
                    style: AppTextStyles.b4Regular
                        .copyWith(color: AppColors.metalColor.shade50),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  GestureDetector btnIncOrDec({required String icon, bool isInc = true}) {
    return GestureDetector(
      onTap: () => onTapIncOrDecrement(isInc: isInc),
      onTapDown: (TapDownDetails details) {
        timer = Timer.periodic(
          const Duration(milliseconds: 100),
          (t) => onTapIncOrDecrement(isInc: isInc),
        );
      },
      onTapUp: (TapUpDetails details) => timer?.cancel(),
      onTapCancel: () => timer?.cancel(),
      child: Container(
          height: 20,
          color: const Color(0xffE5E7EB),
          child: SvgPicture.asset(icon)),
    );
  }

  void onTapIncOrDecrement({bool isInc = true}) {
    FocusManager.instance.primaryFocus?.unfocus();
    if (counterController.text.isEmpty) {
      _count = 1;
    } else {
      _count = int.parse(counterController.text);
    }
    if (isInc) {
      _count++;
    } else if (_count > 1) {
      _count--;
    }
    counterController.text = _count.toString();
  }
}
