import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ichef/config/constants/app_colors.dart';
import 'package:ichef/config/constants/app_decorations.dart';
import 'package:ichef/config/constants/app_text_styles.dart';
import 'package:ichef/config/constants/assets.dart';
import 'package:ichef/config/constants/local_data.dart';
import 'package:ichef/presentation/pages/oil_info/components/info_costadoro_component.dart';
import 'package:ichef/presentation/pages/oil_info/components/ingredients.dart';
import 'package:ichef/presentation/pages/oil_info/components/props_subtitle_item.dart';
import 'package:ichef/presentation/pages/product/components/product_composition_container.dart';
import 'package:ichef/presentation/pages/product/components/product_subs.dart';

import '../product/components/brand_and_saler_container.dart';
import '../product/product_without_image_page.dart';
import 'components/to_favorite_list.dart';

class OilInfoPage extends StatefulWidget {
  const OilInfoPage({Key? key}) : super(key: key);

  @override
  State<OilInfoPage> createState() => _OilInfoPageState();
}

class _OilInfoPageState extends State<OilInfoPage>
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
        primary: true,
        child: Column(
          children: [
            Stack(
              children: [
                SafeArea(
                  child: Align(
                      alignment: Alignment.center,
                      child: Image.asset(Assets.images.oil)),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: SvgPicture.asset(
                            Assets.icons.backArrow,
                            height: 24,
                            color: AppColors.metalColor,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            Assets.icons.share,
                            height: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, top: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  decoration: AppDecorations.defDecor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(Assets.icons.star),
                      Text(
                        ' 14',
                        style: AppTextStyles.b4Regular,
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 20, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Масло оливковое рафинированное с добавлением нерафинированного масла. Costa D'Oro S.P.A.",
                    style: AppTextStyles.h8,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15, top: 20),
                    child: IngredientWidget(),
                  ),
                  Wrap(
                    spacing: 20,
                    children: [
                      ProductSubsComponent(
                        onTap: () {},
                      ),
                      OilToFavoriteComponent(
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            TabBar(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              controller: _tabController,
              unselectedLabelStyle: AppTextStyles.b5Regular
                  .copyWith(color: AppColors.metalColor.shade50),
              labelStyle:
                  AppTextStyles.b5Regular.copyWith(color: AppColors.baseLight),
              indicator: UnderlineTabIndicator(
                borderSide:
                    BorderSide(width: 3.0, color: AppColors.primaryLight),
              ),
              labelPadding: EdgeInsets.zero,
              tabs: List.generate(
                productTabList.length,
                (index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(productTabList[index]),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        margin: const EdgeInsets.only(top: 10),
                        height: index == _tabController.index ? 3 : 2,
                        color: index == _tabController.index
                            ? AppColors.primaryLight
                            : AppColors.metalColor.shade30,
                      )
                    ],
                  );
                },
              ),
            ),
            myListViews(context),
          ],
        ),
      ),
    );
  }

  Widget myListViews(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoCostadoroComponent(
            image: Assets.images.oilComponent,
            subtitle: "сostadoro.ru",
            title: "Costa d'Oro",
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: RichText(
              text: TextSpan(
                text:
                    "Оливковое масло “Olio di Oliva” это полученный с применением современных технологий купаж оливкового рафинированного масла и оливкового масла первого отжима.  “Olio di Oliva”",
                style: AppTextStyles.b5Regular.copyWith(
                  color: AppColors.metalColor.shade70,
                ),
              ),
            ),
          ),
          const ProductCompositionsContainer(
            carbohydrates: 0,
            fats: 100,
            kkal: 900,
            protein: 0,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 6),
            decoration: AppDecorations.defDecor.copyWith(
              color: Colors.transparent,
              border: Border.all(
                color: AppColors.metalColor.shade30,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(Assets.images.barcode),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Свойства:",
              style: AppTextStyles.b6DemiBold,
            ),
          ),
          ...List.generate(
            3,
            (index) =>
                PropertiesSubtitleItemComponent(context: context, index: index),
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
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OilInfoPage()),
                    );
                  },
                  child: BrandAndSalerContainer(
                    onTap: () {},
                    image: salerImages[index],
                    name: salerNames[index],
                    price: salerPrices[index],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 90)
        ],
      ),
    );
  }
}
