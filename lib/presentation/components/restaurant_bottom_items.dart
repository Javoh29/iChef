import 'package:flutter/material.dart';

import '../pages/favorites/favorites_page.dart';

class RestaurantBottomItemsList extends StatelessWidget {
  const RestaurantBottomItemsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width / .75,
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