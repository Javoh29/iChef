import 'package:flutter/material.dart';
import 'package:ichef/config/constants/app_text_styles.dart';
import 'package:ichef/presentation/components/custom_badge.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_decorations.dart';
import '../../config/constants/local_data.dart';
import 'filter_types_container.dart';
import 'prefrences_info_container.dart';
import 'prefrences_products_container.dart';
import 'product_item.dart';
import 'select_options.dart';

class FilterEndDrawer extends StatefulWidget {
  const FilterEndDrawer({Key? key}) : super(key: key);

  @override
  State<FilterEndDrawer> createState() => _FilterEndDrawerState();
}

class _FilterEndDrawerState extends State<FilterEndDrawer> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.85,
      child: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Найдено',
                            style: AppTextStyles.b5Medium.copyWith(fontWeight: FontWeight.w700),
                          ),
                          const CustomBadge(
                            text: '2456',
                            isActive: false,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 22),
                            child: Text(
                              'Сброс',
                              style: AppTextStyles.b4Medium.copyWith(color: AppColors.primaryLight),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: AppDecorations.buttonStyle(
                                borderRadius: 12,
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                bgColor: AppColors.primaryLight.shade100),
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
                PrefrencesInfoContainer(
                  title: 'Мои рецепты',
                  isSwitched: false,
                  textColor: AppColors.metalColor.shade100,
                ),
                PrefrencesInfoContainer(
                  title: 'Чужие рецепты',
                  isSwitched: true,
                  textColor: AppColors.metalColor.shade100,
                ),
                GestureDetector(
                  onTap: () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeIn,
                    );
                  },
                  child: FilterTypesContainer(
                    leading: 'Тип',
                    elements: [
                      Text(
                        'Завтрак, Бранч',
                        style: AppTextStyles.b4DemiBold,
                      ),
                    ],
                  ),
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
                FilterTypesContainer(
                  leading: 'Диета',
                  elements: List.empty(),
                  trailing: Text(
                    'Все',
                    style: AppTextStyles.b5Medium,
                  ),
                ),
                FilterTypesContainer(
                  leading: 'Прием пищи',
                  elements: List.empty(),
                  trailing: Text(
                    'Все',
                    style: AppTextStyles.b5Medium,
                  ),
                ),
                FilterTypesContainer(
                  leading: 'Тип блюда',
                  elements: List.empty(),
                  trailing: Text(
                    'Все',
                    style: AppTextStyles.b5Medium,
                  ),
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
                FilterTypesContainer(
                  leading: 'Сложность готовки',
                  elements: List.empty(),
                  trailing: Text(
                    'Все',
                    style: AppTextStyles.b5Medium,
                  ),
                ),
                PrefrencesInfoContainer(
                  title: 'Блоги',
                  isSwitched: false,
                  textColor: AppColors.metalColor.shade100,
                ),
                PrefrencesInfoContainer(
                  title: 'Чаты',
                  isSwitched: false,
                  textColor: AppColors.metalColor.shade100,
                ),
              ],
            ),
          ),
          SelectOptions(
            pageController: _pageController,
            typeName: "Тип",
            typesList: types,
          ),
        ],
      ),
    );
  }
}
