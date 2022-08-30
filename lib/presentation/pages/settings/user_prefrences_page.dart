import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ichef/config/constants/app_colors.dart';
import 'package:ichef/config/constants/app_text_styles.dart';
import 'package:ichef/config/constants/assets.dart';
import 'package:ichef/presentation/components/custom_expand_tile.dart';
import 'package:ichef/presentation/components/prefrences_info_container.dart';
import 'package:ichef/presentation/components/prefrences_products_container.dart';
import 'package:ichef/presentation/components/product_item.dart';

class UserPrefrencesPage extends StatelessWidget {
  const UserPrefrencesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            Assets.icons.backArrow,
            color: AppColors.metalColor.shade90,
            height: 20,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Предпочтения по продуктов",
          style: AppTextStyles.b5DemiBold,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          CustomExpandTile(
            title: "Общие",
            elements: [
              PrefrencesInfoContainer(title: "Вегетарианец", isSwitched: true),
              PrefrencesInfoContainer(title: "Веган", isSwitched: false),
            ],
          ),
          CustomExpandTile(
            title: "Аллергия ",
            elements: [
              PrefrencesInfoContainer(title: "Глютен", isSwitched: false),
              PrefrencesInfoContainer(title: "Лактоза", isSwitched: false),
              PrefrencesInfoContainer(title: "...", isSwitched: false),
            ],
          ),
          CustomExpandTile(
            title: "Эти продукты я вообще не ем",
            elements: [
              PrefrencesProductsContainer(
                elements:[
                  ProductItem(title: "Пшеничная мука"),
                  ProductItem(title: "Сливочное масло"),
                  ProductItem(title: "Куриное яйцо"),
                ],
              )
            ],
          ),
          CustomExpandTile(
            title: "Эти продукты я не предпочитаю (могу есть только в маленьких дозах как составная часть блюда)",
            elements: [
              PrefrencesProductsContainer(
                elements:[
                  ProductItem(title: "Ванилин"),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
