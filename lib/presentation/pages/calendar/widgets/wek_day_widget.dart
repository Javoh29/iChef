import 'package:flutter/material.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_text_styles.dart';

class WeekDaysWidget extends StatefulWidget {
  const WeekDaysWidget({
    Key? key,
    required this.id,
  }) : super(key: key);
  final int id;

  @override
  State<WeekDaysWidget> createState() => _WeekDaysWidgetState();
}

class _WeekDaysWidgetState extends State<WeekDaysWidget> {
  bool isActive = false;
  final List<String> days = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {});
        isActive = !isActive;
      },
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? AppColors.baseLight : AppColors.baseLight.shade100,
        ),
        child: Text(
          days[widget.id],
          style: AppTextStyles.b5Regular.copyWith(
              fontWeight: FontWeight.w500,
              color: isActive
                  ? AppColors.baseLight.shade100
                  : AppColors.metalColor.shade100),
        ),
      ),
    );
  }
}
