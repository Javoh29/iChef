import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ichef/config/constants/app_colors.dart';
import 'package:ichef/config/constants/app_decorations.dart';
import 'package:ichef/config/constants/app_text_styles.dart';
import 'package:ichef/config/constants/assets.dart';
import 'package:ichef/presentation/pages/calendar/components/calendar_tab_page.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../../routes/routes.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> with SingleTickerProviderStateMixin {
  late DateTime dateTime;
  String dateFormat = '';
  late final TabController _tabController =
      TabController(length: 7, vsync: this);

  @override
  void initState() {
    super.initState();
    dateTime = DateTime.now();
    initializeDateFormatting('RU', null);
    dateFormat = DateFormat('MMMM yyyy', 'RU').format(dateTime);
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
        children: List.generate(
          7,
          (index) => const CalendarTabPage(),
        ),
      ),
    );
  }

  SliverAppBar appBar(bool innerBoxIsScrolled) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      snap: true,
      floating: true,
      forceElevated: innerBoxIsScrolled,
      actions: const [SizedBox.shrink()],
      centerTitle: false,
      title: Row(children: [
        TextButton(
          onPressed: () =>
              Navigator.pushNamed(context, Routes.generationMenuPage),
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
              dateFormat.substring(0, 1).toUpperCase() +
                  dateFormat.substring(1),
              style: AppTextStyles.b5Regular.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {});
            _tabController.animateTo(0);
            dateTime = changeDate(false);
            dateFormat = DateFormat('MMMM yyyy', 'RU').format(dateTime);
          },
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
            onTap: () {
              setState(() {});
              _tabController.animateTo(0);
              dateTime = changeDate(true);
              dateFormat = DateFormat('MMMM yyyy', 'RU').format(dateTime);
            },
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
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(58),
        child: tabBar(),
      ),
    );
  }

  DateTime changeDate(bool isAdd) {
    return isAdd ? dateTime.add(const Duration(days: 7)) : dateTime.subtract(const Duration(days: 7));
  }

  TabBar tabBar() {
    return TabBar(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      controller: _tabController,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(width: 4.0, color: AppColors.primaryLight),
      ),
      tabs: List.generate(
        7,
        (index) {
          return Tab(
            height: 32,
            child: Column(
              children: [
                Text(
                  '${dateTime.add(Duration(days: index)).day}',
                  style: AppTextStyles.b5DemiBold.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryLight),
                ),
                Text(
                  DateFormat('EE', 'RU').format(
                    dateTime.add(Duration(days: index)),
                  ),
                  style: AppTextStyles.b4Regular
                      .copyWith(color: AppColors.metalColor.shade40),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
