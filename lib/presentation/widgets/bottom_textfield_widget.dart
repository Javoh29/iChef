import 'package:flutter/material.dart';
import 'package:ichef/config/constants/app_text_styles.dart';

import '../../config/constants/app_colors.dart';

class BottomTextFiledWidget extends StatelessWidget {
  const BottomTextFiledWidget({
    Key? key,
    required this.mLeading,
    required this.mTrailing,
  }) : super(key: key);

  final Widget? mLeading;
  final Widget? mTrailing;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.white,
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: mLeading,
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
                hintText: 'Ok great, Let me ask arou|',
                hintStyle: AppTextStyles.h5,
              ),
            ),
          ),
          trailing: mTrailing,
        ),
      ),
    );
  }
}
