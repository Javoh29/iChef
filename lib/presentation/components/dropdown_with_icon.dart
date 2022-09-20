import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_decorations.dart';
import '../../config/constants/app_text_styles.dart';

// ignore: must_be_immutable
class DropDownWithIcon extends StatelessWidget {
  DropDownWithIcon({
    required this.title,
    required this.iconPath,
    required this.dropDownValue,
    required this.elements,
    Key? key,
  }) : super(key: key);
  String title;
  String iconPath;
  String dropDownValue;
  List<String> elements;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
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
                  iconPath,
                  height: 16,
                ),
              ),
              DropdownButton(
                underline: const SizedBox(),
                value: dropDownValue,
                isDense: true,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: elements.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(
                      items,
                      style: AppTextStyles.h3.copyWith(
                        color: AppColors.metalColor.shade90,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
