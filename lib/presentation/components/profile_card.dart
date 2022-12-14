import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ichef/config/constants/app_colors.dart';
import 'package:ichef/config/constants/app_decorations.dart';
import 'package:ichef/config/constants/app_text_styles.dart';
import 'package:ichef/data/models/user_model.dart';

import '../../config/constants/assets.dart';
import '../widgets/user_info_avatar_widget.dart';

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
          UserInfoAvatarWidget(
            isClicked: false,
            avatar: model.userImage,
            title: '${model.username}',
            subtitle: '${model.job}',
            onTap: () {},
          ),
          // #bio
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              model.bio ?? '',
              style:
                  AppTextStyles.b4DemiBold.copyWith(fontWeight: FontWeight.w400, color: AppColors.metalColor.shade50),
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
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                ).copyWith(overlayColor: MaterialStateProperty.all(AppColors.baseLight.shade20)),
                onPressed: () {},
                icon: SvgPicture.asset(
                  Assets.icons.contact,
                  color: AppColors.baseLight.shade100,
                ),
                label: Text(
                  '??????????????????????',
                  style: AppTextStyles.b4Medium.copyWith(color: AppColors.baseLight.shade100),
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: SvgPicture.asset(
                  Assets.icons.contact,
                ),
                label: Text(
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
