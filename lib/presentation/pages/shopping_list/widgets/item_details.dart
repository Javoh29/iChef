import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_decorations.dart';
import '../../../../config/constants/app_text_styles.dart';
import '../../../../config/constants/assets.dart';

class ShoppingItemDetails extends StatefulWidget {
  const ShoppingItemDetails({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.weight,
    this.image,
  }) : super(key: key);
  final String title;
  final String subTitle;
  final String? image;
  final int price;
  final int weight;

  @override
  State<ShoppingItemDetails> createState() => _ShoppingItemDetailsState();
}

class _ShoppingItemDetailsState extends State<ShoppingItemDetails> {
  TextEditingController counterController = TextEditingController();
  late Timer timer;
  int count = 1;

  var maskFormatter = MaskTextInputFormatter(mask: '##');

  @override
  void initState() {
    counterController.text = '1';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 5),
      decoration: AppDecorations.defDecor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          widget.image != null
              ? Container(
                  height: 36,
                  width: 36,
                  margin: EdgeInsets.only(right: 10),
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset('${widget.image}', fit: BoxFit.cover)))
              : Container(),
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
                    widget.title,
                    style: AppTextStyles.b4Medium.copyWith(
                      color: AppColors.primaryLight.shade100,
                    ),
                  ),
                ),
                Text(
                  widget.subTitle,
                  style: AppTextStyles.b4Regular
                      .copyWith(color: AppColors.metalColor.shade50),
                ),
                Text('${widget.price} р', style: AppTextStyles.b4DemiBold),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text('${widget.weight} г', style: AppTextStyles.b4DemiBold),
          ),
          Container(
            height: 28,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 3),
            decoration: BoxDecoration(
                color: const Color(0xffE5E7EB),
                borderRadius: BorderRadius.circular(6)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    onTapInOrDecrement(isInc: false);
                  },
                  onTapDown: (TapDownDetails details) {
                    FocusManager.instance.primaryFocus?.unfocus();
                    FocusManager.instance.primaryFocus?.unfocus();

                    timer =
                        Timer.periodic(const Duration(milliseconds: 100), (t) {
                      if (count > 1) {
                        if (counterController.text.isEmpty) {
                          count = 0;
                        } else {
                          count = int.parse(counterController.text);
                        }
                        if (count > 1) {
                          count--;
                        }
                        counterController.text = count.toString();
                        // b = personCount.toString();
                      }
                    });
                  },
                  onTapUp: (TapUpDetails details) => timer.cancel(),
                  onTapCancel: () => timer.cancel(),
                  child: SvgPicture.asset(Assets.icons.icRemoveBlack,
                      color: AppColors.metalColor.shade100),
                ),
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
                    style: AppTextStyles.b3DemiBold.copyWith(fontSize: 12),
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    onTapInOrDecrement(isInc: true);
                  },
                  onTapDown: (TapDownDetails details) {
                    FocusManager.instance.primaryFocus?.unfocus();
                    timer = Timer.periodic(
                      const Duration(milliseconds: 100),
                      (t) => setState(
                        () {
                          if (counterController.text.isEmpty) {
                            count = 0;
                          } else {
                            count = int.parse(counterController.text);
                          }
                          count++;
                          counterController.text = count.toString();
                          // initialBlok = personCount.toString();
                        },
                      ),
                    );
                  },
                  onTapUp: (TapUpDetails details) => timer.cancel(),
                  onTapCancel: () => timer.cancel(),
                  child: SvgPicture.asset(Assets.icons.icAddBlack,
                      color: AppColors.metalColor.shade100),
                ),
                // const SizedBox(width: 25)
              ],
            ),
          )
        ],
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
