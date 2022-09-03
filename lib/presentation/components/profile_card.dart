import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ichef/config/constants/app_colors.dart';
import 'package:ichef/config/constants/app_decorations.dart';
import 'package:ichef/config/constants/app_text_styles.dart';
import 'package:ichef/data/models/user_model.dart';

import '../../config/constants/assets.dart';
import '../widgets/gradient_avatar_widget.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({required this.model, Key? key}) : super(key: key);
  final UserModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // #profile image and username
          Row(
            children: [
              // #profile image
              GradientAvatarWidget(
                colors: const [
                  Color(0xff2934D0),
                  Color(0xffEB47BD),
                ],
                avatarPath: model.userImage ?? "",
                size: 70,
                borderRadius: 35,
              ),
              const SizedBox(width: 12),
              // #username and job
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.username ?? '',
                    style: AppTextStyles.h8,
                  ),
                  Container(
                    // padding: EdgeInsets.symmetric(horizontal: 1),
                    width: MediaQuery.of(context).size.width / 1.45,
                    child: Text(
                      model.job ?? '',
                      style: AppTextStyles.b4DemiBold.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.metalColor.shade50),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // #bio
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              model.bio ?? '',
              style: AppTextStyles.b4DemiBold.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.metalColor.shade50),
            ),
          ),

          // #follow, following and followers
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                style: AppDecorations.buttonStyle(
                  borderRadius: 12,
                  bgColor: AppColors.baseLight,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                ).copyWith(
                    overlayColor:
                        MaterialStateProperty.all(AppColors.baseLight.shade20)),
                onPressed: () {},
                icon: SvgPicture.asset(
                  Assets.icons.contact,
                  color: AppColors.baseLight.shade100,
                ),
                label: Text(
                  'Подписаться',
                  style: AppTextStyles.b4Medium
                      .copyWith(color: AppColors.baseLight.shade100),
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: SvgPicture.asset(
                  Assets.icons.contact,
                ),
                style: TextButton.styleFrom(fixedSize: Size.fromWidth(MediaQuery.of(context).size.width/4)),
                label: AutoSizeText(
                  model.followers ?? '',
                  style: AppTextStyles.h8,
                  maxLines: 1,
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: SvgPicture.asset(
                  Assets.icons.recipeView,
                  color: AppColors.metalColor.shade100,
                ),
                label: Text(
                  model.following ?? '',
                  style: AppTextStyles.h8,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
