import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ichef/config/constants/app_text_styles.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/assets.dart';

class BottomTextFiledWidget extends StatelessWidget {
  const BottomTextFiledWidget({
    Key? key,
    this.mLeading,
    this.mTrailing,
  }) : super(key: key);

  final Widget? mLeading;
  final Widget? mTrailing;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(bottom: 20, top: 10),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: mLeading ??
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  Assets.icons.add,
                  color: AppColors.metalColor.shade100,
                ),
              ),
          title: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.baseLight.shade50,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
            ),
            child: TextField(
              style: AppTextStyles.h5,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Напишите комментарий',
                hintStyle: AppTextStyles.h5.copyWith(color: AppColors.metalColor.shade50),
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
              ),
            ),
          ),
          trailing: mTrailing ??
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  Assets.icons.send,
                  color: AppColors.metalColor.shade100,
                ),
              ),
        ),
      ),
    );
  }
}
