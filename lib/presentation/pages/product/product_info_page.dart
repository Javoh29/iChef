import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ichef/config/constants/app_colors.dart';
import 'package:ichef/config/constants/app_text_styles.dart';
import 'package:ichef/config/constants/assets.dart';
import 'package:ichef/config/constants/local_data.dart';
import 'package:ichef/presentation/pages/product/components/product_buy_component.dart';
import 'package:ichef/presentation/pages/product/components/product_composition_container.dart';
import 'package:ichef/presentation/pages/product/components/product_subs.dart';
import 'package:ichef/presentation/routes/routes.dart';

import '../../components/custom_badge.dart';
import '../../components/recipe_item.dart';
import 'components/brand_and_saler_container.dart';

class ProductInfoPage extends StatefulWidget {
  const ProductInfoPage({
    Key? key,
    required this.productModel,
  }) : super(key: key);
  final ProductModel productModel;

  @override
  State<ProductInfoPage> createState() => _ProductInfoPageState();
}

class _ProductInfoPageState extends State<ProductInfoPage>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);
  final ScrollController _scrollController = ScrollController();
  bool isOpenPanel = true;

  @override
  void initState() {
    super.initState();
    _tabController.addListener(() => setState(() {}));
    _scrollController.addListener(() {
      isOpenPanel = true;
      if (_scrollController.offset <= 0) {
        setState(() {});
        isOpenPanel = false;
      } else {
        setState(() {});
        isOpenPanel = true;
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  Image.asset(widget.productModel.image,
                      fit: BoxFit.cover, width: double.infinity),
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
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productModel.title,
                      style: AppTextStyles.h8
                          .copyWith(color: AppColors.metalColor.shade90),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        widget.productModel.ingredient,
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
                          text: widget.productModel.desc,
                          style: AppTextStyles.b5Regular.copyWith(
                            color: AppColors.metalColor.shade70,
                          ),
                          children: [
                            TextSpan(
                              text: " ???????????????? ??????",
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
                        widget.productModel.subtitle,
                        style: AppTextStyles.b6DemiBold,
                      ),
                    ),
                    SizedBox(
                      height: 125,
                      width: double.infinity,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              // Navigator.pushNamed(
                              //     context, Routes.productWithoutImagePage);
                            },
                            child: BrandAndSalerContainer(
                              image:
                                  widget.productModel.items.brandImages[index],
                              name: widget.productModel.items.brandNames[index],
                              price:
                                  widget.productModel.items.brandPrices[index],
                              onTap: () {
                                Navigator.pushNamed(context, Routes.oilPage);
                              },
                            ),
                          );
                        },
                        itemCount: widget.productModel.items.brandPrices.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: TabBar(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                controller: _tabController,
                unselectedLabelStyle: AppTextStyles.b5Regular
                    .copyWith(color: AppColors.metalColor.shade50),
                labelStyle: AppTextStyles.b5Regular
                    .copyWith(color: AppColors.baseLight),
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
                          tabCounter[index] != 0
                              ? CustomBadge(
                                  text: '${tabCounter[index]}',
                                  isActive: _tabController.index == index,
                                )
                              : Container(),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 3,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  controller: _scrollController,
                  primary: false,
                  physics: !isOpenPanel
                      ? const NeverScrollableScrollPhysics()
                      : const BouncingScrollPhysics(),
                  itemCount: listRecipes.length,
                  itemBuilder: (context, index) => RecipeItem(
                    model: listRecipes[index],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List tabCounter = [25, 0, 2407];

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
