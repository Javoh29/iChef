import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ichef/config/constants/app_colors.dart';
import 'package:ichef/config/constants/app_text_styles.dart';
import 'package:ichef/config/constants/assets.dart';
import 'package:ichef/presentation/components/custom_expand_tile.dart';
import 'package:ichef/presentation/components/prefrences_info_container.dart';

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
            id: 1,
            title: "Система питания/Диета (вместо слово общие)",
            elements: [
              PrefrencesInfoContainer(title: "Вегатарианец", isSwitched: true),
              PrefrencesInfoContainer(title: "Веган", isSwitched: false),
              PrefrencesInfoContainer(title: "Аткинс", isSwitched: false),
              PrefrencesInfoContainer(title: "Дюкан", isSwitched: false),
              PrefrencesInfoContainer(title: "Кимкинс", isSwitched: false),
              PrefrencesInfoContainer(title: "Саут-Бич", isSwitched: false),
              PrefrencesInfoContainer(title: "Стиллман", isSwitched: false),
              PrefrencesInfoContainer(title: "Малышева", isSwitched: false),
              PrefrencesInfoContainer(title: "Магги", isSwitched: false),
            ],
          ),
          CustomExpandTile(
            id: 2,
            title: "Аллергия",
            elements: [
              PrefrencesInfoContainer(title: "Глютен", isSwitched: false),
              PrefrencesInfoContainer(title: "Лактоза", isSwitched: false),
              PrefrencesInfoContainer(
                  title: "Коровий белок", isSwitched: false),
              PrefrencesInfoContainer(
                  title: "Куриный белок", isSwitched: false),
              PrefrencesInfoContainer(title: "Орехи", isSwitched: false),
              PrefrencesInfoContainer(title: "Бобовые", isSwitched: false),
              PrefrencesInfoContainer(
                  title: "Красные овощи", isSwitched: false),
            ],
          ),
          // CustomExpandTile(
          //   title: "Эти продукты я вообще не ем",
          //   elements: [
          //     PrefrencesProductsContainer(
          //       elements:[
          //         ProductItem(title: "Пшеничная мука"),
          //         ProductItem(title: "Сливочное масло"),
          //         ProductItem(title: "Куриное яйцо"),
          //       ],
          //     )
          //   ],
          // ),
          // CustomExpandTile(
          //   title: "Эти продукты я не предпочитаю (могу есть только в маленьких дозах как составная часть блюда)",
          //   elements: [
          //     PrefrencesProductsContainer(
          //       elements:[
          //         ProductItem(title: "Ванилин"),
          //       ],
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}
