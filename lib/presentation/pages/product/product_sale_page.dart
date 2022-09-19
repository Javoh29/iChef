import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ichef/config/constants/app_colors.dart';
import 'package:ichef/config/constants/app_text_styles.dart';
import 'package:ichef/config/constants/assets.dart';
import 'package:ichef/config/constants/local_data.dart';
import 'package:ichef/presentation/pages/product/components/product_composition_container.dart';

import '../../components/custom_badge.dart';
import '../../components/recipe_item.dart';
import 'components/brand_and_saler_container.dart';
import 'components/product_buy_component.dart';
import 'components/product_subs.dart';

// ignore: must_be_immutable
class ProductSalePage extends StatefulWidget {
  const ProductSalePage({Key? key}) : super(key: key);

  @override
  State<ProductSalePage> createState() => _ProductSalePageState();
}

class _ProductSalePageState extends State<ProductSalePage>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  @override
  void initState() {
    super.initState();
    _tabController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              Image.asset(
                Assets.images.flourImg,
                scale: 0.1,
              ),
              SafeArea(
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset(
                    Assets.icons.backArrow,
                    height: 24,
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Molino Grassi Manitoba 00",
                  style: AppTextStyles.h8
                      .copyWith(color: AppColors.metalColor.shade90),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Инградиент - Бакалея - Пшеничная мука",
                    style: AppTextStyles.b4Regular
                        .copyWith(color: AppColors.metalColor.shade50),
                  ),
                ),
                Wrap(
                  spacing: 20,
                  children: [
                    ProductSubsComponent(
                      onTap: () {},
                    ),
                    ProductBuyComponent(
                      onTap: () {},
                    ),
                  ],
                ),
                const ProductCompositionsContainer(
                  protein: 56,
                  fats: 62,
                  carbohydrates: 56,
                  kkal: 12226,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: RichText(
                    text: TextSpan(
                      text:
                          "Американский тыквенный пирог с корицей — классика застолья Среднего и прочего Запада, анекдотический персонаж американского быта не лишен, однако, прелести ",
                      style: AppTextStyles.b5Regular.copyWith(
                        color: AppColors.metalColor.shade70,
                      ),
                      children: [
                        TextSpan(
                          text: "показать еще",
                          style: AppTextStyles.b5Regular.copyWith(
                            color: AppColors.primaryLight.shade100
                                .withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Купить",
                    style: AppTextStyles.b6DemiBold,
                  ),
                ),
                SizedBox(
                  height: 125,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return BrandAndSalerContainer(
                        onTap: () {},
                        image: salerImages[index],
                        name: salerNames[index],
                        price: salerPrices[index],
                      );
                    },
                    itemCount: salerImages.length,
                  ),
                ),
              ],
            ),
          ),
          TabBar(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            controller: _tabController,
            unselectedLabelStyle: AppTextStyles.b5Regular
                .copyWith(color: AppColors.metalColor.shade50),
            labelStyle:
                AppTextStyles.b5Regular.copyWith(color: AppColors.baseLight),
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 4.0, color: AppColors.primaryLight),
            ),
            tabs: List.generate(
              profileTabList.length,
              (index) {
                return Tab(
                  height: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(profileTabList[index]),
                      CustomBadge(
                        text: '24K',
                        isActive: _tabController.index == index,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          myListViews(),
        ],
      ),
    );
  }

  Widget myListViews() {
    return Column(
      children: [
        // horizontal listview
        ...List.generate(
          listRecipes.length,
          (index) => RecipeItem(
            model: listRecipes[index],
          ),
        ),
      ],
    );
  }
}
