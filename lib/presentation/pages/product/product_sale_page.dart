import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ichef/config/constants/app_colors.dart';
import 'package:ichef/config/constants/app_decorations.dart';
import 'package:ichef/config/constants/app_text_styles.dart';
import 'package:ichef/config/constants/assets.dart';
import 'package:ichef/config/constants/local_data.dart';

import 'components/brand_and_saler_container.dart';
import 'components/product_composition.dart';

// ignore: must_be_immutable
class ProductSalePage extends StatelessWidget {
  ProductSalePage({required this.productName, Key? key}) : super(key: key);
  String productName;

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
                  productName,
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
                  spacing: 15,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: SvgPicture.asset(Assets.icons.subscribe),
                      label: Text(
                        "Подписаться",
                        style: AppTextStyles.b4Medium.copyWith(
                          color: AppColors.baseLight.shade100,
                        ),
                      ),
                      style: AppDecorations.buttonStyle(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 12,
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: SvgPicture.asset(Assets.icons.basket),
                      label: Text(
                        "В список покупок",
                        style: AppTextStyles.b4Medium.copyWith(
                          color: AppColors.primaryLight,
                        ),
                      ),
                      style: AppDecorations.buttonStyle(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 12,
                        ),
                        bgColor: AppColors.baseLight.shade100,
                        border: BorderSide(
                          color: AppColors.primaryLight,
                          width: 1,
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: AppDecorations.defDecor.copyWith(
                    color: Colors.transparent,
                    border: Border.all(
                      color: AppColors.metalColor.shade30,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "12226",
                          style: AppTextStyles.b4DemiBold,
                          children: [
                            TextSpan(
                              text: " Ккал на 100 г\n\n",
                              style: AppTextStyles.b5Regular.copyWith(
                                color: AppColors.metalColor.shade50,
                              ),
                            ),
                            productComposition(56, "Белки"),
                            productComposition(62, "Жиры"),
                            productComposition(56, "Углеводы"),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        radius: 17,
                        child: Center(
                          child: InkWell(
                            onTap: () {},
                            child: Transform.rotate(
                              angle: 3.14,
                              child: SvgPicture.asset(
                                Assets.icons.backArrow,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
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
                        image: salerImages[index],
                        name: salerNames[index],
                        price: salerPrices[index],
                      );
                    },
                    itemCount: 3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
