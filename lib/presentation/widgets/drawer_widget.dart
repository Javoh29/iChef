import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ichef/config/constants/app_colors.dart';
import 'package:ichef/config/constants/assets.dart';
import 'package:ichef/config/constants/local_data.dart';
import 'package:ichef/presentation/components/custom_badge.dart';
import 'package:ichef/presentation/components/dropdown_with_icon.dart';

import '../../config/constants/app_decorations.dart';
import '../../config/constants/app_text_styles.dart';
import '../components/ingridient_expand_tile.dart';

class IngredientsDrawer extends StatefulWidget {
  const IngredientsDrawer({Key? key}) : super(key: key);

  @override
  State<IngredientsDrawer> createState() => _IngredientsDrawerState();
}

class _IngredientsDrawerState extends State<IngredientsDrawer> {
  bool isSwitch = false;
  String dropdownvalue = '1';
  String dropdownvalueCal = '5-10';

  var items = ['1', '2', '3', '4', '5'];
  var itemsCal = ['5-10', '5-11', '5-12', '5-13'];

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
                  DropDownWithIcon(
                    title: "Количество персон",
                    iconPath: Assets.icons.peoples,
                    dropDownValue: dropdownvalue,
                    elements: items,
                  ),
                  DropDownWithIcon(
                    title: "Кол-во дней",
                    iconPath: Assets.icons.calendar,
                    dropDownValue: dropdownvalueCal,
                    elements: itemsCal,
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
            IngridientsExpandTile(
              title: "Название раздела",
              elements: firstIngredientsRazdel,
            ),
            IngridientsExpandTile(
              title: "Название раздела",
              elements: secondIngredientsRazdel,
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
