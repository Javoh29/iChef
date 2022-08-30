import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ichef/config/constants/app_colors.dart';
import 'package:ichef/config/constants/app_text_styles.dart';
import 'package:ichef/config/constants/assets.dart';
import 'package:ichef/presentation/components/recipe_item.dart';

import '../../../config/constants/local_data.dart';

class DishReplaceMentPage extends StatefulWidget {
  const DishReplaceMentPage({Key? key}) : super(key: key);

  @override
  State<DishReplaceMentPage> createState() => _DishReplaceMentPageState();
}

class _DishReplaceMentPageState extends State<DishReplaceMentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(12),
          ),
        ),
        // #back button
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(
            Assets.icons.backArrow,
            color: AppColors.metalColor.shade100,
          ),
        ),
        // #title
        title: Column(
          children: [
            Text(
              'Заменить завтрак',
              style: AppTextStyles.h5.copyWith(fontWeight: FontWeight.w700),
            ),
            Text(
              'Пересчет на 21 апреля, вт',
              style: AppTextStyles.b4Regular,
            ),
          ],
        ),
        // #search button
        actions: [
          IconButton(
            onPressed: (){},
            icon: SvgPicture.asset(
              Assets.icons.search,
              color: AppColors.metalColor.shade100,
            ),
          ),
        ],
        // #bottom
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 40),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.metalColor.shade40),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                info.length,
                (index) => Row(
                  children: [
                    //#text
                    RichText(
                      text: TextSpan(
                        text: info[index]["amount"],
                        style: AppTextStyles.b5Regular.copyWith(color: AppColors.metalColor.shade100),
                        children: [
                          TextSpan(
                            text: info[index]["type"],
                            style: AppTextStyles.b5Regular.copyWith(color: AppColors.metalColor.shade50),
                          ),
                        ],
                      ),
                    ),
                    // #icon
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: SvgPicture.asset(info[index]["status"] == "down" ? Assets.icons.down : Assets.icons.up),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: List.generate(
          listRecipes.length,
          (index) => Stack(
            children: [
              RecipeItem(
                model: listRecipes[index],
              ),
              Positioned(
                top: 22,
                left: 20,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.metalColor.shade70,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.baseLight.shade40),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      info.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Row(
                          children: [
                            //#text
                            RichText(
                              text: TextSpan(
                                text: "${info[index]["amount"]} ",
                                style: AppTextStyles.b4Medium.copyWith(color: AppColors.metalColor.shade10),
                                children: [
                                  TextSpan(
                                    text: info[index]["type"],
                                    style: AppTextStyles.b4Regular.copyWith(color: AppColors.baseLight.shade40),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 22,
                right: 20,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.baseLight.shade40),
                      color: AppColors.metalColor.shade70,
                    ),
                    child: Text(
                      "Выбрать",
                      style: AppTextStyles.b4Regular.copyWith(color: AppColors.baseLight.shade100),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
