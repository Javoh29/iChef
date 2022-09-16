import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_decorations.dart';
import '../../config/constants/assets.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({
    required this.selectedIndex,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final int selectedIndex;
  final Function onTap;
  final List<String> menuIcons = [
    Assets.icons.homeMenu,
    Assets.icons.recipesMenu,
    Assets.icons.favoritesMenu,
    Assets.icons.calendarMenu,
    Assets.icons.cartMenu,
    Assets.icons.settingsMenu,
  ];

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 44,
        decoration: AppDecorations.defDecor.copyWith(
            color: AppColors.baseLight.shade100,
            borderRadius: BorderRadius.circular(0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            menuIcons.length,
            (index) => menuItem(index),
          ),
        ),
      ),
    );
  }

  Widget menuItem(int index) {
    return InkWell(
      onTap: () => onTap(index),
      child: Container(
        height: 32,
        width: 32,
        alignment: Alignment.center,
        // decoration: selectedIndex == index
        //     ? AppDecorations.defDecor.copyWith(
        //         borderRadius: BorderRadius.circular(12),
        //         color: AppColors.metalColor.shade10,
        //       )
        //     : null,
        child: SvgPicture.asset(
          menuIcons[index],
          height: 16,
          width: 16,
        ),
      ),
    );
  }
}
