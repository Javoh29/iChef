import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_decorations.dart';
import '../../config/constants/app_text_styles.dart';
import '../../config/constants/assets.dart';
import '../../data/models/user_account_model.dart';
import '../../data/models/user_model.dart';
import '../pages/favorites/favorites_page.dart';
import '../widgets/user_info_avatar_widget.dart';
import 'restaurant_bottom_items.dart';

Future<dynamic> userAccountsBottomSheet(BuildContext context, UserModel model) {
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
                              children: Column(
                            children: [
                              UserInfoAvatarWidget(
                                isClicked: true,
                                avatar: null,
                                title: 'Ресторан Temantoga',
                                subtitle: 'Невский проспект 123',
                                onTap: () {},
                              ),
                              Container(
                                height: 62,
                                margin: const EdgeInsets.only(top: 25, bottom: 20),
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                decoration: AppDecorations.defDecor,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 24,
                                      padding: const EdgeInsets.all(5),
                                      margin: const EdgeInsets.only(right: 15),
                                      decoration:
                                          BoxDecoration(shape: BoxShape.circle, color: AppColors.baseLight.shade100),
                                      child: SvgPicture.asset(Assets.icons.star),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Тариф',
                                            style:
                                                AppTextStyles.b4Regular.copyWith(color: AppColors.metalColor.shade50),
                                          ),
                                          Text(
                                            'Ресторан',
                                            style: AppTextStyles.b4Regular.copyWith(
                                              color: AppColors.primaryLight,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      'до 15.06.2023',
                                      style: AppTextStyles.b5DemiBold.copyWith(color: AppColors.metalColor.shade90),
                                    ),
                                  ],
                                ),
                              ),
                              const RestaurantBottomItemsList(),
                            ],
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
                    title: '${userAccounts[index]['name']}',
                    subtitle: '${userAccounts[index]['desc']}',
                    onTap: () {},
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: AppDecorations.buttonStyle()
                  .copyWith(fixedSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width, 48))),
              child: Text(
                'Добавить новый бизнес-аккаунт',
                style: AppTextStyles.b4Medium.copyWith(color: AppColors.baseLight.shade100),
              ),
            ),
            const SizedBox(height: 20)
          ],
        ),
      );
    },
  );
}
