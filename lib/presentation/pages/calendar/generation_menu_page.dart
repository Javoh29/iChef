import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ichef/config/constants/app_decorations.dart';
import 'package:ichef/config/constants/app_text_styles.dart';
import 'package:ichef/config/constants/assets.dart';
import 'package:ichef/presentation/pages/calendar/widgets/chapter_widget.dart';
import 'package:ichef/presentation/pages/calendar/widgets/wek_day_widget.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../config/constants/app_colors.dart';

class GenerationPage extends StatefulWidget {
  const GenerationPage({Key? key}) : super(key: key);

  @override
  State<GenerationPage> createState() => _GenerationPageState();
}

class _GenerationPageState extends State<GenerationPage> {
  TextEditingController personController = TextEditingController();
  TextEditingController doseController = TextEditingController();
  late Timer timer;
  int personCount = 1;
  var maskFormatter = MaskTextInputFormatter(mask: '####');
  var dailyDose = MaskTextInputFormatter(mask: '#########');
  double sliderValue = 0;
  var start;
  var end;

  @override
  void initState() {
    super.initState();
    personController.text = '1';
    doseController.text = '1';
  }

  @override
  Widget build(BuildContext context) {
    start = dateTimeRange.start;
    end = dateTimeRange.end;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Генерация меню',
          style: AppTextStyles.h1.copyWith(fontSize: 14),
        ),
        elevation: 0,
        leading: IconButton(
            onPressed: () {}, icon: SvgPicture.asset(Assets.icons.icBack)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, bottom: 10, top: 10),
            child: ElevatedButton(
              onPressed: () {},
              style: AppDecorations.buttonStyle(),
              child: Text('Применить', style: AppTextStyles.b4Medium),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ChapterWidget(
                title: 'Количество персон',
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          onTapInOrDecrement(count: 1, isInc: false);
                        },
                        onTapDown: (TapDownDetails details) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          FocusManager.instance.primaryFocus?.unfocus();

                          timer = Timer.periodic(
                              const Duration(milliseconds: 100), (t) {
                            if (personCount > 1) {
                              if (personController.text.isEmpty) {
                                personCount = 0;
                              } else {
                                personCount = int.parse(personController.text);
                              }
                              if (personCount > 1) {
                                personCount--;
                              }
                              personController.text = personCount.toString();
                              // b = personCount.toString();
                            }
                          });
                        },
                        onTapUp: (TapUpDetails details) => timer.cancel(),
                        onTapCancel: () => timer.cancel(),
                        child: Container(
                          width: 42,
                          height: 42,
                          padding: const EdgeInsets.all(9),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: AppColors.baseLight.shade100),
                          child: SvgPicture.asset(Assets.icons.icRemove),
                        ),
                      ),
                      Container(
                        width: 92,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          inputFormatters: [maskFormatter],
                          cursorColor: Colors.black,
                          textAlign: TextAlign.center,
                          controller: personController,
                          style:
                              AppTextStyles.b3DemiBold.copyWith(fontSize: 36),
                          maxLines: 1,
                          keyboardType: TextInputType.number,
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          onTapInOrDecrement(count: personCount, isInc: true);
                        },
                        onTapDown: (TapDownDetails details) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          timer = Timer.periodic(
                            const Duration(milliseconds: 100),
                            (t) => setState(
                              () {
                                if (personController.text.isEmpty) {
                                  personCount = 0;
                                } else {
                                  personCount = int.parse(personController.text);
                                }
                                personCount++;
                                personController.text = personCount.toString();
                                // initialBlok = personCount.toString();
                              },
                            ),
                          );
                        },
                        onTapUp: (TapUpDetails details) => timer.cancel(),
                        onTapCancel: () => timer.cancel(),
                        child: Container(
                          width: 42,
                          height: 42,
                          padding: const EdgeInsets.all(9),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: AppColors.baseLight.shade100),
                          child: SvgPicture.asset(Assets.icons.icAdd),
                        ),
                      ),
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
                            value: sliderValue,
                            onChanged: (value) {
                              setState(() {});
                              sliderValue = value;
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
                            style: AppTextStyles.b4Regular
                                .copyWith(color: MetalColor().shade50),
                          ),
                          Text(
                            'Часто',
                            style: AppTextStyles.b4Regular
                                .copyWith(color: MetalColor().shade50),
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
                  padding:
                      const EdgeInsets.only(bottom: 8, right: 16.0, left: 16),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.7,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          cursorWidth: 4,
                          inputFormatters: [dailyDose],
                          cursorColor: Colors.black,
                          textAlign: TextAlign.center,
                          controller: doseController,
                          style:
                              AppTextStyles.b3DemiBold.copyWith(fontSize: 36),
                          maxLines: 1,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            // hintText: 'Ккал',
                            // hintStyle: TextStyle()
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: AppDecorations.buttonStyle().copyWith(
                            elevation: const MaterialStatePropertyAll(0),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                            padding: const MaterialStatePropertyAll(
                                EdgeInsets.all(10)),
                            fixedSize: const MaterialStatePropertyAll(
                                Size.fromHeight(40)),
                            backgroundColor: MaterialStatePropertyAll(
                                AppColors.baseLight.shade100)),
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
                  padding:
                      const EdgeInsets.only(bottom: 8, right: 16.0, left: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        onTap: () {
                          pickDateRange(context)
                              .then((value) => {setState(() {})});
                        },
                        child: Container(
                          height: 40,
                          alignment: Alignment.center,
                          width: 92,
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                              color: AppColors.baseLight.shade100,
                              borderRadius: BorderRadius.circular(30)),
                          child: Text(
                            '${start.day}.${start.month}.${start.year}',
                            style: AppTextStyles.b5Regular.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Text(
                          '—',
                          style: AppTextStyles.b4DemiBold
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                      ),
                      InkWell(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        onTap: () {
                          pickDateRange(context)
                              .then((value) => {setState(() {})});
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 92,
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                              color: AppColors.baseLight.shade100,
                              borderRadius: BorderRadius.circular(30)),
                          child: Text(
                            '${end.day}.${end.month}.${end.year}',
                            style: AppTextStyles.b5Regular.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ChapterWidget(
                title: 'Повторять по дням',
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 8, right: 16.0, left: 16),
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 6),
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 7,
                    itemBuilder: (context, index) => WeekDaysWidget(id: index),
                  ),
                ),
              ),
            ],
          ),
        ),
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

  void onTapInOrDecrement({required int count, required bool isInc}) {
    if (isInc) {
      setState(() {
        if (personController.text.isEmpty) {
          personCount = 0;
        } else {
          personCount = int.parse(personController.text);
        }
        personCount++;
        personController.text = personCount.toString();
      });
    } else {
      setState(() {
        if (personController.text.isEmpty) {
          personCount = 0;
        } else {
          personCount = int.parse(personController.text);
        }
        if (personCount > 0) personCount--;
        personController.text = personCount.toString();
      });
    }
  }
}

