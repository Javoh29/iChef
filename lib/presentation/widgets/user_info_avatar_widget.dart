import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_text_styles.dart';
import '../../config/constants/assets.dart';
import 'gradient_avatar_widget.dart';

class UserInfoAvatarWidget extends StatelessWidget {
  const UserInfoAvatarWidget({
    Key? key,
    required this.avatar,
    required this.isClicked,
    this.onTap,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  final String? avatar;
  final String title, subtitle;
  final bool isClicked;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        avatar != null
            ? GradientAvatarWidget(
                colors: const [
                  Color(0xff2934D0),
                  Color(0xffEB47BD),
                ],
                avatarPath: Image.asset(avatar ?? ''),
                size: 70,
                borderRadius: 35,
              )
            : Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(color: AppColors.primaryLight, shape: BoxShape.circle),
              ),
        const SizedBox(width: 12),
        // #username and job
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onTap,
              child: Row(
                children: [
                  Text(
                    '$title ',
                    style: AppTextStyles.h8,
                  ),
                  Visibility(
                    visible: isClicked,
                    child: RotatedBox(
                        quarterTurns: 3,
                        child: SvgPicture.asset(
                          Assets.icons.backArrow,
                          color: AppColors.metalColor.shade90,
                          height: 12,
                        )),
                  )
                ],
              ),
            ),
            Text(
              subtitle,
              style:
                  AppTextStyles.b4DemiBold.copyWith(fontWeight: FontWeight.w400, color: AppColors.metalColor.shade50),
            ),
          ],
        ),
      ],
    );
  }
}