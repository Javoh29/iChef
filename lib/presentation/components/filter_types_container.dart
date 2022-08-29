import 'package:flutter/material.dart';
import 'package:ichef/config/constants/assets.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_decorations.dart';
import '../../config/constants/app_text_styles.dart';

// ignore: must_be_immutable
class FilterTypesContainer extends StatelessWidget {
  FilterTypesContainer({this.elements, required this.leading,this.trailing, Key? key}) : super(key: key);
  List<Widget>? elements;
  String leading;
  Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(10),
      decoration: AppDecorations.defDecor,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    leading,
                    style: AppTextStyles.b5Medium.copyWith(color: AppColors.primaryLight),
                  ),
                  trailing??Image(
                    image: AssetImage(Assets.icons.cancelBlack),
                    width: 16,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Wrap(
                  spacing: 10,
                  children: [...elements!],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
