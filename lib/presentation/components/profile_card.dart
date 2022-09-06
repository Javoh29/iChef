import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ichef/config/constants/app_colors.dart';
import 'package:ichef/config/constants/app_decorations.dart';
import 'package:ichef/config/constants/app_text_styles.dart';
import 'package:ichef/data/models/user_model.dart';
import 'package:ichef/presentation/pages/settings/user_prefrences_page.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../config/constants/assets.dart';
import '../pages/favorites/favorites_page.dart';
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
          GestureDetector(
            onTap: () => userInfoBottomSheet(context),
            child: Row(
              children: [
                // #profile image
                UserInfoAvatarWidget(
                  isClicked: false,
                  avatar: model.userImage,
                  title: '${model.username}',
                  subtitle: '${model.job}',
                  onTap: () {},
                ),
              ],
            ),
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

  Future<dynamic> userInfoBottomSheet(BuildContext context) {
    return showCupertinoModalBottomSheet(
      context: context,
      bounce: true,
      topRadius: const Radius.circular(30),
      builder: (context) {
        return BottomSheetModel(
          children: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: UserInfoAvatarWidget(
                  isClicked: true,
                  avatar: model.userImage,
                  title: '${model.username}',
                  subtitle: '${model.job}',
                  onTap: () {
                    Navigator.pop(context);
                    userAccountsBottomSheet(context);
                  },
                ),
              ),
              const ProfileBottomItemsList(),
              const SizedBox(height: 60)
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> userAccountsBottomSheet(BuildContext context) {
    return showCupertinoModalBottomSheet(
      topRadius: const Radius.circular(30),
      context: context,
      builder: (context) {
        return BottomSheetModel(
          children: Column(
            children: [
              ...List.generate(
                4,
                (index) => GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    showCupertinoModalBottomSheet(
                      topRadius: const Radius.circular(30),
                      context: context,
                      bounce: true,
                      builder: (context) {
                        return ListView(
                          shrinkWrap: true,
                          children: [
                            BottomSheetModel(
                                children: SingleChildScrollView(
                              child: Column(
                                children: [
                                  UserInfoAvatarWidget(
                                    isClicked: true,
                                    avatar: null,
                                    title: 'Ресторан Temantoga',
                                    subtitle: 'Невскиconst й проспект 123',
                                    onTap: () {},
                                  ),
                                  Container(
                                    height: 62,
                                    margin: const EdgeInsets.only(
                                        top: 25, bottom: 20),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: AppDecorations.defDecor,
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 24,
                                          padding: const EdgeInsets.all(5),
                                          margin:
                                              const EdgeInsets.only(right: 15),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color:
                                                  AppColors.baseLight.shade100),
                                          child: SvgPicture.asset(
                                              Assets.icons.star),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Тариф',
                                                style: AppTextStyles.b4Regular
                                                    .copyWith(
                                                        color: AppColors
                                                            .metalColor
                                                            .shade50),
                                              ),
                                              Text(
                                                'Ресторан',
                                                style: AppTextStyles.b4Regular
                                                    .copyWith(
                                                  color: AppColors.primaryLight,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          'до 15.06.2023',
                                          style: AppTextStyles.b5DemiBold
                                              .copyWith(
                                                  color: AppColors
                                                      .metalColor.shade90),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const RestaurantBottomItemsList(),
                                ],
                              ),
                            )),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    decoration: AppDecorations.defDecor,
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(12),
                    height: 94,
                    child: UserInfoAvatarWidget(
                      isClicked: false,
                      avatar: index == 0 ? model.userImage : null,
                      title: '${model.username}',
                      subtitle: '${model.job}',
                      onTap: () {},
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: AppDecorations.buttonStyle().copyWith(
                    fixedSize: MaterialStatePropertyAll(
                        Size(MediaQuery.of(context).size.width, 48))),
                child: Text(
                  'Добавить новый бизнес-аккаунт',
                  style: AppTextStyles.b4Medium
                      .copyWith(color: AppColors.baseLight.shade100),
                ),
              ),
              const SizedBox(height: 60)
            ],
          ),
        );
      },
    );
  }
}

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
                decoration: BoxDecoration(
                    color: AppColors.primaryLight, shape: BoxShape.circle),
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
              style: AppTextStyles.b4DemiBold.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.metalColor.shade50),
            ),
          ],
        ),
      ],
    );
  }
}

class ProfileBottomItemsList extends StatelessWidget {
  const ProfileBottomItemsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BSheetItemWidget(
          title: 'Личные настройки',
          onTap: () {},
          haveLeading: false,
          haveTrailing: false,
        ),
        BSheetItemWidget(
          title: 'Предпочтения по продуктам',
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserPrefrencesPage(),
                ));
          },
          haveLeading: false,
          haveTrailing: false,
        ),
        BSheetItemWidget(
          title: 'Подписки',
          onTap: () {},
          haveLeading: false,
          haveTrailing: false,
        ),
        BSheetItemWidget(
          title: 'Настройки календаря',
          onTap: () {},
          haveLeading: false,
          haveTrailing: false,
        ),
        BSheetItemWidget(
          title: 'Семья',
          onTap: () {},
          haveLeading: false,
          haveTrailing: false,
        ),
        BSheetItemWidget(
          title: 'Данные и приватность',
          onTap: () {},
          haveLeading: false,
          haveTrailing: false,
        ),
        BSheetItemWidget(
          title: 'Настройки уведомлений',
          onTap: () {},
          haveLeading: false,
          haveTrailing: false,
        ),
        BSheetItemWidget(
          title: 'Авторизоваться на веб-версию',
          onTap: () {},
          haveLeading: false,
          haveTrailing: false,
        ),
      ],
    );
  }
}

class RestaurantBottomItemsList extends StatelessWidget {
  const RestaurantBottomItemsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width/.75,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          BSheetItemWidget(
            title: 'Настройки бренда',
            onTap: () {},
            haveLeading: false,
            haveTrailing: false,
          ),
          BSheetItemWidget(
            title: 'Рекламная компания',
            onTap: () {},
            haveLeading: false,
            haveTrailing: false,
          ),
          BSheetItemWidget(
            title: 'Видео меню',
            onTap: () {},
            haveLeading: false,
            haveTrailing: false,
          ),
          BSheetItemWidget(
            title: 'Права доступа',
            onTap: () {},
            haveLeading: false,
            haveTrailing: false,
          ),
          BSheetItemWidget(
            title: 'Информация и контакты',
            onTap: () {},
            haveLeading: false,
            haveTrailing: false,
          ),
          BSheetItemWidget(
            title: 'Данные и приватность',
            onTap: () {},
            haveLeading: false,
            haveTrailing: false,
          ),
          BSheetItemWidget(
            title: 'Платежи и счета',
            onTap: () {},
            haveLeading: false,
            haveTrailing: false,
          ),
          BSheetItemWidget(
            title: 'Рецепты',
            onTap: () {},
            haveLeading: false,
            haveTrailing: false,
          ),
          BSheetItemWidget(
            title: 'Добавить рецепт',
            onTap: () {},
            haveLeading: false,
            haveTrailing: false,
          ),
          BSheetItemWidget(
            title: 'Добавить элемент видео меню',
            onTap: () {},
            haveLeading: false,
            haveTrailing: false,
          ),
          const SizedBox(height: 60)
        ],
      ),
    );
  }
}
