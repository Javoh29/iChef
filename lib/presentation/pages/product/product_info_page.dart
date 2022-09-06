import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ichef/config/constants/app_colors.dart';
import 'package:ichef/config/constants/app_text_styles.dart';
import 'package:ichef/config/constants/assets.dart';
import 'package:ichef/config/constants/local_data.dart';
import 'package:ichef/presentation/pages/product/components/product_buy_component.dart';
import 'package:ichef/presentation/pages/product/components/product_composition_container.dart';
import 'package:ichef/presentation/pages/product/components/product_subs.dart';
import 'package:ichef/presentation/pages/product/product_without_image_page.dart';

import '../../components/custom_badge.dart';
import '../../components/recipe_item.dart';
import 'components/brand_and_saler_container.dart';

class ProductInfoPage extends StatefulWidget {
  const ProductInfoPage({Key? key}) : super(key: key);

  @override
  State<ProductInfoPage> createState() => _ProductInfoPageState();
}

class _ProductInfoPageState extends State<ProductInfoPage>
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(Assets.images.wheatFlourImg),
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
                    "Пшеничная мука",
                    style: AppTextStyles.h8
                        .copyWith(color: AppColors.metalColor.shade90),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Инградиент - Бакалея",
                      style: AppTextStyles.b4Regular
                          .copyWith(color: AppColors.metalColor.shade50),
                    ),
                  ),
                  Wrap(
                    spacing: 15,
                    children: const [
                      ProductSubsComponent(),
                      ProductBuyComponent(),
                    ],
                  ),
                  const ProductCompositionsContainer(),
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
                      "Бренды",
                      style: AppTextStyles.b6DemiBold,
                    ),
                  ),
                  SizedBox(
                    height: 125,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ProductWithoutImagePage()),
                            );
                          },
                          child: BrandAndSalerContainer(
                            image: brandImages[index],
                            name: brandNames[index],
                            price: brandPrices[index],
                          ),
                        );
                      },
                      itemCount: 3,
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
                borderSide:
                    BorderSide(width: 4.0, color: AppColors.primaryLight),
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
