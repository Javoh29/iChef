
import 'package:flutter/material.dart';

import '../pages/favorites/favorites_page.dart';
import '../routes/routes.dart';

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
            Navigator.pop(context);
            Navigator.pushNamed(context, Routes.userPrefrencesPage);
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