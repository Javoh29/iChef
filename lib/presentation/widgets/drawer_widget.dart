import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ichef/config/constants/app_colors.dart';
import 'package:ichef/config/constants/assets.dart';
import 'package:ichef/presentation/components/custom_badge.dart';

import '../../config/constants/app_decorations.dart';
import '../../config/constants/app_text_styles.dart';
import '../components/ingridient_detail_container.dart';

class IngredientsDrawer extends StatelessWidget {
  const IngredientsDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      '10-15',
      '15-25',
      '25-40',
      '40-60',
      '60-100',
    ];

    return Drawer(
      width: MediaQuery.of(context).size.width - 70,
      backgroundColor: AppColors.baseLight.shade100,
      child: SafeArea(
        minimum: const EdgeInsets.all(10),
        child: Column(
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
                  style: AppDecorations.buttonStyle(
                      padding: const EdgeInsets.symmetric(horizontal: 12)),
                  child: Text(
                    "В покупки",
                    style: AppTextStyles.b4Medium
                        .copyWith(color: AppColors.baseLight.shade100),
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
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 12,
                        ),
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
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(
                                    items,
                                    style: AppTextStyles.h3,
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
                        margin: const EdgeInsets.only(top: 9, right: 16),
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 12,
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
                              items: itemsCal.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(
                                    items,
                                    style: AppTextStyles.h3,
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
                  color: const Color(0xFFF3F4F6),
                ),
              ),
              child: Row(
                children: [
                  const Flexible(
                    child: Text(
                      "Вычеркивайте добавленные инградиенты в процессе готовки, чтобы ничего не забыть",
                    ),
                  ),
                  CupertinoSwitch(
                    value: isSwitch,
                    onChanged: ((value) {
                      isSwitch = !isSwitch;
                    }),
                  ),
                ],
              ),
            ),
            ExpandablePanel(
              header: Text(
                "Название раздела",
                style: AppTextStyles.b5DemiBold,
              ),
              collapsed: const IngridientDetailContainer(
                isActive: false,
                title: "Пшеничная мука",
                addInfo: "Manitoba 400",
                data: "400 г, 3 шт",
              ),
              expanded: Column(
                children: const [
                  IngridientDetailContainer(
                    isActive: false,
                    title: "Пшеничная мука",
                    addInfo: "Manitoba 400",
                    data: "400 г, 3 шт",
                  ),
                  IngridientDetailContainer(
                    isActive: false,
                    title: "Сливочное масло",
                    addInfo: "",
                    data: "400 г, 3 шт",
                  ),
                ],
              ),
            ),
            ExpandablePanel(
              header: Text(
                "Название раздела",
                style: AppTextStyles.b5DemiBold,
              ),
              collapsed: const IngridientDetailContainer(
                isActive: true,
                title: "Куриное яйцо",
                addInfo: "C0",
                data: "400 г, 3 шт",
              ),
              expanded: Column(
                children: const [
                  IngridientDetailContainer(
                    isActive: true,
                    title: "Куриное яйцо",
                    addInfo: "C0",
                    data: "400 г, 3 шт",
                  ),
                  IngridientDetailContainer(
                    isActive: true,
                    title: "Тыква",
                    addInfo: "",
                    data: "400 г, 3 шт",
                  ),
                  IngridientDetailContainer(
                    isActive: false,
                    title: "Корица",
                    addInfo: "KOTANYI целая",
                    data: "400 г, 3 шт",
                  ),
                  IngridientDetailContainer(
                    isActive: false,
                    title: "Соль",
                    addInfo: "",
                    data: "400 г, 3 шт",
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: (() {}),
              child: Container(
                width: double.infinity,
                height: 44,
                decoration: AppDecorations.defDecor.copyWith(
                  color: AppColors.baseLight.shade50,
                ),
                child: Center(
                  child: Text(
                    "Добавить",
                    style: AppTextStyles.b5Regular,
                  ),
                ),
              ),
            ),
            TextButton(
              style: AppDecorations.buttonStyle(
                bgColor: AppColors.baseLight.shade50,
              ),
              onPressed: (() {}),
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
