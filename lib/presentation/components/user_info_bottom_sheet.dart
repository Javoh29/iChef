import 'package:flutter/material.dart';
import 'package:ichef/presentation/components/user_acc_bottom_sheet.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../data/models/user_model.dart';
import '../pages/favorites/favorites_page.dart';
import '../widgets/profile_bottom_items_widget.dart';
import '../widgets/user_info_avatar_widget.dart';

Future<dynamic> userInfoBottomSheet(BuildContext context, UserModel model) {
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
                  userAccountsBottomSheet(context, model);
                },
              ),
            ),
            const ProfileBottomItemsList(),
            // const SizedBox(height: 60)
          ],
        ),
      );
    },
  );
}
