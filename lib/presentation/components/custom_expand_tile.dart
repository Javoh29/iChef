import 'package:flutter/material.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_text_styles.dart';

// ignore: must_be_immutable
class CustomExpandTile extends StatelessWidget {
  CustomExpandTile({
    required this.id,
    required this.title,
    required this.elements,
    Key? key,
  }) : super(key: key);
  String title;
  int id;
  List<Widget> elements;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedIconColor: AppColors.metalColor.shade90,
      iconColor: AppColors.metalColor.shade90,
      title: Text(
        title,
        style: AppTextStyles.b5DemiBold,
      ),
      tilePadding: EdgeInsets.zero,
      initiallyExpanded: id == 1,
      children: elements,
    );
  }
}
