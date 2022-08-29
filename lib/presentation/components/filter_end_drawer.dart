import 'package:flutter/material.dart';
import 'package:ichef/config/constants/app_text_styles.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_decorations.dart';
import 'filter_types_container.dart';
import 'prefrences_info_container.dart';
import 'prefrences_products_container.dart';
import 'product_item.dart';

class FilterEndDrawer extends StatefulWidget {
  const FilterEndDrawer({Key? key}) : super(key: key);

  @override
  State<FilterEndDrawer> createState() => _FilterEndDrawerState();
}

class _FilterEndDrawerState extends State<FilterEndDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Найдено',
                    style: AppTextStyles.b5Medium.copyWith(fontWeight: FontWeight.w700),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                    margin: const EdgeInsets.only(left: 5),
                    decoration: AppDecorations.defDecor,
                    child: Text('2456', style: AppTextStyles.b4Regular),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 22),
                    child: Text(
                      'Сброс',
                      style:
                          AppTextStyles.b4Medium.copyWith(fontWeight: FontWeight.w700, color: AppColors.primaryLight),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(AppColors.primaryLight.shade100),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    child: Text(
                      'Показать',
                      style: AppTextStyles.b4Medium.copyWith(color: AppColors.baseLight.shade100),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          PrefrencesInfoContainer(
            title: 'Мои рецепты',
            isSwitched: false,
            textColor: AppColors.metalColor.shade100,
          ),
          FilterTypesContainer(
            leading: 'Тип',
            elements: [
              Text(
                'Завтрак, Бранч',
                style: AppTextStyles.b4DemiBold,
              ),
            ],
          ),
          FilterTypesContainer(
            leading: 'Кухня',
            elements: [
              Text(
                'Русская',
                style: AppTextStyles.b4DemiBold,
              ),
            ],
          ),
          FilterTypesContainer(
            leading: 'Способ приготовления',
            elements: [
              Text(
                'Способ 1, Способ 2, Способ 3, Тип 2,\nСпособ 4, Способ 5,Способ 5,',
                style: AppTextStyles.b4DemiBold,
              ),
            ],
          ),
          PrefrencesInfoContainer(
            title: 'Чужие рецепты',
            isSwitched: true,
            textColor: AppColors.metalColor.shade100,
          ),
          PrefrencesProductsContainer(
            elements: [
              ProductItem(title: 'Цезарь'),
              ProductItem(title: 'Масло'),
            ],
            title: 'Метки включая',
          ),
          PrefrencesProductsContainer(
            elements: List.empty(),
            title: 'Метки исключая',
          ),
          PrefrencesProductsContainer(
            elements: [
              ProductItem(title: 'Цезарь'),
              ProductItem(title: 'Масло'),
              PrefrencesInfoContainer(
                title: 'Мои рецепты',
                isSwitched: false,
                textColor: AppColors.metalColor.shade100,
              ),
              PrefrencesInfoContainer(
                title: 'Мои рецепты',
                isSwitched: false,
                textColor: AppColors.metalColor.shade100,
              ),
            ],
            title: 'Ингредиенты включая',
          ),
          PrefrencesProductsContainer(
            elements: List.empty(),
            title: 'Метки исключая',
          ),
          PrefrencesInfoContainer(
            title: 'Мои рецепты',
            isSwitched: false,
            textColor: AppColors.metalColor.shade100,
          ),
          PrefrencesInfoContainer(
            title: 'Мои рецепты',
            isSwitched: false,
            textColor: AppColors.metalColor.shade100,
          ),
        ],
      ),
    );
  }
}
