import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ichef/presentation/pages/product/components/discount_container.dart';

import '../../../config/constants/app_colors.dart';
import '../../../config/constants/app_text_styles.dart';
import '../../../config/constants/assets.dart';
import '../../../config/constants/local_data.dart';
import '../../components/custom_badge.dart';
import '../../components/recipe_item.dart';
import 'components/product_buy_component.dart';
import 'components/product_subs.dart';

class ProductWithoutImagePage extends StatefulWidget {
  const ProductWithoutImagePage({Key? key}) : super(key: key);

  @override
  State<ProductWithoutImagePage> createState() =>
      _ProductWithoutImagePageState();
}

class _ProductWithoutImagePageState extends State<ProductWithoutImagePage>
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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            Assets.icons.backArrow,
            height: 24,
            color: AppColors.metalColor,
          ),
        ),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Philips A673B",
                  style: AppTextStyles.h8
                      .copyWith(color: AppColors.metalColor.shade90),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "?????????? - ??????????????????????",
                    style: AppTextStyles.b4Regular
                        .copyWith(color: AppColors.metalColor.shade50),
                  ),
                ),
                Wrap(
                  spacing: 15,
                  children: [
                    ProductSubsComponent(
                      onTap: () {},
                    ),
                    ProductBuyComponent(
                      onTap: () {},
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: RichText(
                    text: TextSpan(
                      text:
                          "???????????????????????? ?????????????????? ?????????? ?? ?????????????? ??? ???????????????? ???????????????? ???????????????? ?? ?????????????? ????????????, ???????????????????????????? ???????????????? ?????????????????????????? ???????? ???? ??????????, ????????????, ???????????????? ",
                      style: AppTextStyles.b5Regular.copyWith(
                        color: AppColors.metalColor.shade70,
                      ),
                      children: [
                        TextSpan(
                          text: "???????????????? ??????",
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
                    "????????????",
                    style: AppTextStyles.b6DemiBold,
                  ),
                ),
                SizedBox(
                  height: 135,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: DiscountContainer(
                            imagePath: Assets.images.saler3,
                            name: "Ozon",
                            originalPrice: "1 499",
                            discountPrice: "999"),
                      );
                    },
                    itemCount: 1,
                  ),
                )
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
