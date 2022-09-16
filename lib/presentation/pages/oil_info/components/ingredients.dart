import 'package:flutter/material.dart';
import 'package:ichef/config/constants/local_data.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_decorations.dart';
import '../../../../config/constants/app_text_styles.dart';
import '../../product/product_info_page.dart';

class IngredientWidget extends StatefulWidget {
  const IngredientWidget({Key? key}) : super(key: key);

  @override
  State<IngredientWidget> createState() => _IngredientWidgetState();
}

class _IngredientWidgetState extends State<IngredientWidget> {
  BoxDecoration decoration = AppDecorations.defDecor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: decoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductInfoPage(
                        productModel: model[1],
                      ),
                    ),
                  );
                },
                style: AppDecorations.buttonStyle(
                  bgColor: AppColors.primaryLight.shade50,
                  border: BorderSide(
                    width: 1,
                    color: AppColors.primaryLight.shade100,
                  ),
                ),
                child: Text(
                  'Масло рафинированное',
                  style: AppTextStyles.b4Medium.copyWith(
                    color: AppColors.primaryLight.shade100,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 6.0),
            child: Text(
              'Ингредиент',
              style: AppTextStyles.b4Regular.copyWith(
                color: AppColors.metalColor.shade50,
              ),
            ),
          )
          // : Container(),
        ],
      ),
    );
  }
}
