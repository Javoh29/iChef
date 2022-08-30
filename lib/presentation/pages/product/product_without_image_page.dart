import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ichef/presentation/pages/product/components/discount_container.dart';

import '../../../config/constants/app_colors.dart';
import '../../../config/constants/app_text_styles.dart';
import '../../../config/constants/assets.dart';
import 'components/product_buy_component.dart';
import 'components/product_subs.dart';

class ProductWithoutImagePage extends StatelessWidget {
  const ProductWithoutImagePage({Key? key}) : super(key: key);

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
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              "Philips A673B",
              style: AppTextStyles.h8
                  .copyWith(color: AppColors.metalColor.shade90),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Товар - Электроника",
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
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
                        color: AppColors.primaryLight.shade100.withOpacity(0.6),
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
    );
  }
}