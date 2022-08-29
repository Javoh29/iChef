import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ichef/config/constants/app_colors.dart';
import 'package:ichef/config/constants/app_decorations.dart';
import 'package:ichef/config/constants/app_text_styles.dart';
import 'package:ichef/config/constants/assets.dart';
import 'package:ichef/presentation/pages/home/recipes_tab_page.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../../components/custom_badge.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> with SingleTickerProviderStateMixin {
  late final TabController _tabController = TabController(length: 3, vsync: this);
  DateTime? dateTime;
  String dateFormat = '';

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('RU', null);
    dateFormat = DateFormat('MMMM yyyy', 'RU').format(dateTime ?? DateTime.now());
    _tabController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      physics: const NeverScrollableScrollPhysics(),
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return <Widget>[
          appBar(innerBoxIsScrolled),
        ];
      },
      body: TabBarView(
        controller: _tabController,
        children: [
          const RecipesTabPage(),
          Container(color: Colors.blue, child: const Center(child: Text('Блоги'))),
          Container(color: Colors.red, child: const Center(child: Text('Чат'))),
        ],
      ),
    );
  }

  SliverAppBar appBar(bool innerBoxIsScrolled) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      floating: true,
      forceElevated: innerBoxIsScrolled,
      actions: const [SizedBox.shrink()],
      centerTitle: false,
      title: Row(children: [
        TextButton(
          onPressed: () {},
          style: AppDecorations.buttonStyle(
            bgColor: AppColors.baseLight.shade100,
            border: BorderSide(
              width: 1,
              color: AppColors.primaryLight.shade100,
            ),
          ),
          child: Text(
            'Выбрать за меня',
            style: AppTextStyles.b4Medium.copyWith(
              color: AppColors.primaryLight.shade100,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              dateFormat.substring(0, 1).toUpperCase() + dateFormat.substring(1),
              style: AppTextStyles.b5Regular.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: SvgPicture.asset(
            Assets.icons.back,
            width: 16,
            height: 16,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: GestureDetector(
            onTap: () {},
            child: RotatedBox(
              quarterTurns: 2,
              child: SvgPicture.asset(
                Assets.icons.back,
                width: 16,
                height: 16,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ]),
      bottom: const CalendarWidget(),
    );
  }
}

class DateModel {
  final String weekDay;
  final String day;
  bool isActive;

  DateModel({
    required this.weekDay,
    required this.day,
    required this.isActive,
  });
}

class CalendarWidget extends StatefulWidget implements PreferredSizeWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(138);
}

class _CalendarWidgetState extends State<CalendarWidget> {
  @override
  void initState() {
    initializeDateFormatting('RU', null);
    super.initState();
  }

  int selIndex = 0;

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
                      '${DateTime.now().add(Duration(days: index)).day}',
                      style:
                          AppTextStyles.b5DemiBold.copyWith(fontWeight: FontWeight.w700, color: AppColors.primaryLight),
                    ),
                    Text(
                      DateFormat('EE', 'RU').format(
                        DateTime.now().add(Duration(days: index)),
                      ),
                      style: AppTextStyles.b4Regular.copyWith(color: AppColors.metalColor.shade40),
                    ),
                    Container(
                      height: 4,
                      margin: const EdgeInsets.only(top: 4),
                      width: MediaQuery.of(context).size.width / 7,
                      color: selIndex == index ? AppColors.primaryLight : Colors.transparent,
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

class FoodComposition extends StatefulWidget {
  const FoodComposition({Key? key}) : super(key: key);

  @override
  State<FoodComposition> createState() => _FoodCompositionState();
}

class _FoodCompositionState extends State<FoodComposition> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), border: Border.all(color: AppColors.metalColor.shade30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: AppDecorations.defDecor
                .copyWith(color: AppColors.primaryLight, borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                SvgPicture.asset(Assets.icons.twoPerson),
                Text(
                  '3',
                  style: AppTextStyles.b4Medium.copyWith(color: AppColors.baseLight.shade100),
                )
              ],
            ),
          ),
          Row(
            children: [
              Text('56 ', style: AppTextStyles.b5Regular),
              Text(
                'Б',
                style: AppTextStyles.b5Regular.copyWith(
                  color: AppColors.metalColor.shade50,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text('62 ', style: AppTextStyles.b5Regular),
              Text(
                'Ж',
                style: AppTextStyles.b5Regular.copyWith(
                  color: AppColors.metalColor.shade50,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text('62 ', style: AppTextStyles.b5Regular),
              Text(
                'У',
                style: AppTextStyles.b5Regular.copyWith(
                  color: AppColors.metalColor.shade50,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text('6122 ', style: AppTextStyles.b5Regular),
              Text(
                'Ккал',
                style: AppTextStyles.b5Regular.copyWith(
                  color: AppColors.metalColor.shade50,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
