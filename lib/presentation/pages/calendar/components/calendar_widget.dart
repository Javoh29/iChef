import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_text_styles.dart';
import 'food_composition.dart';

class CalendarWidget extends StatefulWidget implements PreferredSizeWidget {
  const CalendarWidget({Key? key, required this.date}) : super(key: key);

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
  final DateTime date;

  @override
  Size get preferredSize => const Size.fromHeight(133);
}

class _CalendarWidgetState extends State<CalendarWidget> {
  int selIndex = 0;

  @override
  void initState() {
    initializeDateFormatting('RU', null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              7,
              (index) => InkWell(
                onTap: () => setState(() => selIndex = index),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${widget.date.add(Duration(days: index)).day}',
                      style: AppTextStyles.b5DemiBold.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryLight),
                    ),
                    Text(
                      DateFormat('EE', 'RU').format(
                        widget.date.add(Duration(days: index)),
                      ),
                      style: AppTextStyles.b4Regular
                          .copyWith(color: AppColors.metalColor.shade40),
                    ),
                    Container(
                      height: 4,
                      margin: const EdgeInsets.only(top: 4),
                      width: MediaQuery.of(context).size.width / 7,
                      color: selIndex == index
                          ? AppColors.primaryLight
                          : Colors.transparent,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const FoodComposition()
      ],
    );
  }
}
