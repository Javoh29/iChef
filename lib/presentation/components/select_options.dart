import 'dart:math';

import 'package:flutter/material.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_decorations.dart';
import '../../config/constants/app_text_styles.dart';

class SelectOptions extends StatelessWidget {
  const SelectOptions({
    Key? key,
    required PageController pageController,
    required this.typeName,
    required this.typesList,
  })  : _pageController = pageController,
        super(key: key);
  final String typeName;
  final List<String> typesList;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeIn,
                    );
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.metalColor.shade100,
                  ),
                ),
                Text(
                  typeName,
                  style: AppTextStyles.b5DemiBold,
                ),
              ],
            ),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: List.generate(
                  typesList.length,
                  (index) => Container(
                    decoration: AppDecorations.defDecor.copyWith(borderRadius: BorderRadius.circular(0)),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 0,
                      leading: Checkbox(
                        onChanged: (bool? value) {},
                        value: Random.secure().nextBool(),
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      ),
                      title: Text(
                        typesList[index],
                        style: AppTextStyles.b4DemiBold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
