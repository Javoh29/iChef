import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_decorations.dart';
import '../../../../config/constants/app_text_styles.dart';
import '../../../../config/constants/assets.dart';

class FoodComposition extends StatefulWidget {
  const FoodComposition({Key? key}) : super(key: key);

  @override
  State<FoodComposition> createState() => _FoodCompositionState();
}

class _FoodCompositionState extends State<FoodComposition> {
  int selected = 0;
  List types = [
    'Б',
    'Ж',
    'У',
    'Ккал',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.5),
      height: 56,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.metalColor.shade30)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: 5,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => setState(() => selected = index),
                child: FoodCompositionItems(
                  count: 1,
                  icon: index == 0 ? Assets.icons.twoPerson : null,
                  isActive: selected == index,
                  type: index != 0 ? '${types[index - 1]}' : '',
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class FoodCompositionItems extends StatelessWidget {
  const FoodCompositionItems({
    Key? key,
    this.icon,
    required this.count,
    required this.isActive,
    this.type,
  }) : super(key: key);
  final String? icon;
  final int count;
  final String? type;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: isActive
          ? AppDecorations.defDecor.copyWith(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(12))
          : null,
      padding: isActive
          ? const EdgeInsets.symmetric(horizontal: 20)
          : const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          icon != null
              ? SvgPicture.asset(
                  Assets.icons.twoPerson,
                  color: isActive
                      ? AppColors.primaryLight.shade50
                      : AppColors.metalColor,
                  fit: BoxFit.cover,
                )
              : Container(),
          Text(
            ' $count',
            style: isActive
                ? AppTextStyles.b4Regular
                    .copyWith(color: AppColors.baseLight.shade100)
                : AppTextStyles.b5Regular,
          ),
          Text(
            ' $type',
            style: isActive
                ? AppTextStyles.b4Regular
                    .copyWith(color: AppColors.baseLight.shade100)
                : AppTextStyles.b5Regular.copyWith(
                    color: AppColors.metalColor.shade50,
                  ),
          )
        ],
      ),
    );
  }
}
