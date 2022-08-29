import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ichef/config/constants/app_decorations.dart';
import 'package:ichef/config/constants/app_text_styles.dart';
import 'package:ichef/config/constants/assets.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../config/constants/app_colors.dart';
import 'components/chapter_widget.dart';
import 'components/wek_day_widget.dart';

class GenerationMenuPage extends StatefulWidget {
  const GenerationMenuPage({Key? key}) : super(key: key);

  @override
  State<GenerationMenuPage> createState() => _GenerationMenuPageState();
}

class _GenerationMenuPageState extends State<GenerationMenuPage> {
  final TextEditingController _personController = TextEditingController();
  final TextEditingController _doseController = TextEditingController();
  Timer? _timerCounter;
  int _personCount = 1;
  final _personCountFormatter = MaskTextInputFormatter(mask: '###');
  final _dailyDose = MaskTextInputFormatter(mask: '######');
  double _sliderValue = 0;
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void initState() {
    super.initState();
    _personController.text = '1';
    _doseController.text = '1';
  }

  @override
  void dispose() {
    _personController.dispose();
    _doseController.dispose();
    _timerCounter?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _startDate = dateTimeRange.start;
    _endDate = dateTimeRange.end;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Генерация меню',
          style: AppTextStyles.h1.copyWith(fontSize: 14),
        ),
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SvgPicture.asset(
              Assets.icons.back,
              height: 20,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, bottom: 10, top: 10),
            child: TextButton(
              onPressed: () {},
              style: AppDecorations.buttonStyle(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  borderRadius: 12),
              child: Text('Применить',
                  style: AppTextStyles.b4Medium
                      .copyWith(color: AppColors.baseLight.shade100)),
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children: [
          ChapterWidget(
            title: 'Количество персон',
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  btnIncOrDec(icon: Assets.icons.remove, isInc: false),
                  Container(
                    width: 92,
                    height: 45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      inputFormatters: [_personCountFormatter],
                      cursorColor: AppColors.metalColor.shade100,
                      textAlign: TextAlign.center,
                      controller: _personController,
                      style: AppTextStyles.b3DemiBold.copyWith(fontSize: 36),
                      maxLines: 1,
                      onEditingComplete: () {
                        if (_personController.text.isEmpty) {
                          _personController.text = '1';
                        }
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                    ),
                  ),
                  btnIncOrDec(icon: Assets.icons.add),
                  // const SizedBox(width: 25)
                ],
              ),
            ),
          ),
          ChapterWidget(
            title: 'Частота готовки',
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 26,
                    width: double.infinity,
                    child: SliderTheme(
                      data: const SliderThemeData(trackHeight: 10),
                      child: CupertinoSlider(
                        activeColor: AppColors.primaryLight,
                        value: _sliderValue,
                        onChanged: (value) {
                          setState(() {
                            _sliderValue = value;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Редко',
                        style: AppTextStyles.b4Regular.copyWith(color: MetalColor().shade50),
                      ),
                      Text(
                        'Часто',
                        style: AppTextStyles.b4Regular.copyWith(color: MetalColor().shade50),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          ChapterWidget(
            title: 'Ваша суточная доза',
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8, right: 16.0, left: 16),
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  Flexible(
                    child: Container(
                      height: 45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        cursorWidth: 4,
                        inputFormatters: [_dailyDose],
                        cursorColor: Colors.black,
                        textAlign: TextAlign.center,
                        controller: _doseController,
                        style: AppTextStyles.b3DemiBold.copyWith(fontSize: 36),
                        maxLines: 1,
                        onEditingComplete: () {
                          if (_doseController.text.isEmpty) _doseController.text = '1';
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: AppDecorations.buttonStyle().copyWith(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.all(10),
                      ),
                      fixedSize: MaterialStateProperty.all(
                        const Size.fromHeight(40),
                      ),
                      backgroundColor: MaterialStateProperty.all(AppColors.baseLight.shade100),
                    ),
                    child: Text(
                      'Ккал',
                      style: AppTextStyles.b5Regular.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ChapterWidget(
            title: 'Начало и конец',
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8, right: 16, left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  btnDateTime(context, _startDate),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Text(
                      '—',
                      style: AppTextStyles.b4DemiBold.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                  btnDateTime(context, _endDate),
                ],
              ),
            ),
          ),
          ChapterWidget(
            title: 'Повторять по дням',
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                children: List.generate(7, (index) => WeekDaysWidget(id: index)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextButton btnDateTime(BuildContext context, DateTime? dateTime) {
    return TextButton(
      onPressed: () => pickDateRange(context).then((value) => setState(() {})),
      style: AppDecorations.buttonStyle(
        padding: const EdgeInsets.all(10),
        borderRadius: 20,
        bgColor: AppColors.baseLight.shade100,
      ),
      child: Text(
        DateFormat('dd.MM.yyyy').format(dateTime ?? DateTime.now()),
        style: AppTextStyles.b5Regular.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  GestureDetector btnIncOrDec({required String icon, bool isInc = true}) {
    return GestureDetector(
      onTap: () => onTapIncOrDecrement(isInc: isInc),
      onTapDown: (TapDownDetails details) {
        _timerCounter = Timer.periodic(
          const Duration(milliseconds: 100),
          (t) => onTapIncOrDecrement(isInc: isInc),
        );
      },
      onTapUp: (TapUpDetails details) => _timerCounter?.cancel(),
      onTapCancel: () => _timerCounter?.cancel(),
      child: Container(
        width: 42,
        height: 42,
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: AppColors.baseLight.shade100),
        child: SvgPicture.asset(icon),
      ),
    );
  }

  Future pickDateRange(BuildContext context) async {
    DateTimeRange? newDataRange = await showDateRangePicker(
        context: context,
        firstDate: DateTime(1900),
        initialDateRange: dateTimeRange,
        lastDate: DateTime(2200),
        builder: (context, child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.green,
                primaryColorDark: Colors.green,
                accentColor: Colors.green,
              ),
              dialogBackgroundColor: Colors.white,
            ),
            child: child!,
          );
        });
    if (newDataRange == null) return;

    setState(() {
      dateTimeRange = newDataRange;
    });
  }

  DateTimeRange dateTimeRange =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());

  void onTapIncOrDecrement({bool isInc = true}) {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_personController.text.isEmpty) {
      _personCount = 1;
    } else {
      _personCount = int.parse(_personController.text);
    }
    if (isInc) {
      _personCount++;
    } else if (_personCount > 1) {
      _personCount--;
    }
    _personController.text = _personCount.toString();
  }
}
