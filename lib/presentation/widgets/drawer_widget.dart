import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ichef/config/constants/app_colors.dart';
import 'package:ichef/config/constants/assets.dart';
import 'package:ichef/presentation/components/custom_badge.dart';

import '../../config/constants/app_decorations.dart';
import '../../config/constants/app_text_styles.dart';
import '../components/ingridient_detail_container.dart';

class IngredientsDrawer extends StatefulWidget {
  const IngredientsDrawer({Key? key}) : super(key: key);

  @override
  State<IngredientsDrawer> createState() => _IngredientsDrawerState();
}

class _IngredientsDrawerState extends State<IngredientsDrawer> {
  bool isSwitch = false;
  String dropdownvalue = '1';
  String dropdownvalueCal = '5-10';
  var items = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];
  var itemsCal = [
    '5-10',
    '5-11',
    '5-12',
    '5-13',
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width - 70,
      backgroundColor: AppColors.baseLight.shade100,
      child: SafeArea(
        minimum: const EdgeInsets.all(10),
        child: ListView(
          shrinkWrap: true,
          children: [
            Row(
              children: [
                Text(
                  "Ингредиенты ",
                  style: AppTextStyles.h5,
                ),
                const CustomBadge(text: "24", isActive: false),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  style: AppDecorations.buttonStyle(padding: const EdgeInsets.symmetric(horizontal: 12)),
                  child: Text(
                    "В покупки",
                    style: AppTextStyles.b4Medium.copyWith(color: AppColors.baseLight.shade100),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Количество персон",
                        style: AppTextStyles.b4Regular,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 9),
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        decoration: AppDecorations.defDecor.copyWith(
                          color: AppColors.metalColor.shade10,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: SvgPicture.asset(
                                Assets.icons.peoples,
                                height: 16,
                              ),
                            ),
                            DropdownButton(
                              underline: const SizedBox(),
                              value: dropdownvalue,
                              isDense: true,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(
                                    items,
                                    style: AppTextStyles.h6,
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Кол-во дней",
                        style: AppTextStyles.b4Regular,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 9),
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 15,
                        ),
                        decoration: AppDecorations.defDecor.copyWith(
                          color: AppColors.metalColor.shade10,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: SvgPicture.asset(
                                Assets.icons.calendar,
                                height: 16,
                              ),
                            ),
                            DropdownButton(
                              underline: const SizedBox(),
                              value: dropdownvalueCal,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              isDense: true,
                              items: itemsCal.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(
                                    items,
                                    style: AppTextStyles.h6,
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: AppDecorations.defDecor.copyWith(
                color: Colors.transparent,
                border: Border.all(
                  width: 1,
                  color: AppColors.metalColor.shade10,
                ),
              ),
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      "Вычеркивайте добавленные инградиенты в процессе готовки, чтобы ничего не забыть",
                      style: AppTextStyles.b4Regular,
                    ),
                  ),
                  CupertinoSwitch(
                    value: isSwitch,
                    onChanged: (value) {
                      setState(() {
                        isSwitch = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            ExpansionTile(
              title: Text(
                "Название раздела",
                style: AppTextStyles.b5DemiBold,
              ),
              tilePadding: EdgeInsets.zero,
              initiallyExpanded: true,
              children: const [
                IngridientDetailContainer(
                  isActive: false,
                  title: "Пшеничная мука",
                  addInfo: "Manitoba 400",
                  data: "400 г, 3 шт",
                ),
                SizedBox(
                  height: 5,
                ),
                IngridientDetailContainer(
                  isActive: false,
                  title: "Сливочное масло",
                  addInfo: "",
                  data: "400 г, 3 шт",
                ),
              ],
            ),
            ExpansionTile(
              tilePadding: EdgeInsets.zero,
              initiallyExpanded: true,
              title: Text(
                "Название раздела",
                style: AppTextStyles.b5DemiBold,
              ),
              children: const [
                IngridientDetailContainer(
                  isActive: true,
                  title: "Куриное яйцо",
                  addInfo: "C0",
                  data: "400 г, 3 шт",
                ),
                SizedBox(
                  height: 5,
                ),
                IngridientDetailContainer(
                  isActive: true,
                  title: "Тыква",
                  addInfo: "",
                  data: "400 г, 3 шт",
                ),
                SizedBox(
                  height: 5,
                ),
                IngridientDetailContainer(
                  isActive: false,
                  title: "Корица",
                  addInfo: "KOTANYI целая",
                  data: "400 г, 3 шт",
                ),
                SizedBox(
                  height: 5,
                ),
                IngridientDetailContainer(
                  isActive: false,
                  title: "Соль",
                  addInfo: "",
                  data: "400 г, 3 шт",
                ),
              ],
            ),
            TextButton(
              style: AppDecorations.buttonStyle(
                bgColor: AppColors.primaryLight.shade50,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              onPressed: () {},
              child: Text(
                "Добавить",
                style: AppTextStyles.b5Regular,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
