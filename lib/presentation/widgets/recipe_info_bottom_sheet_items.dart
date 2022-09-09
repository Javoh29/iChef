
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/assets.dart';
import '../../config/constants/local_data.dart';
import '../pages/favorites/favorites_page.dart';

class RecipeInfoPageBottomSheetItems extends StatelessWidget {
  const RecipeInfoPageBottomSheetItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      BSheetItemWidget(
        title: commands[0],
        onTap: () {},
        haveLeading: false,
        haveTrailing: true,
      ),
      BSheetItemWidget(
        title: commands[1],
        onTap: () {},
        haveLeading: false,
        haveTrailing: true,
      ),
      BSheetItemWidget(
        title: commands[2],
        onTap: () {},
        haveLeading: false,
        haveTrailing: true,
      ),
      BSheetItemWidget(
        title: commands[3],
        onTap: () {},
        haveLeading: false,
        haveTrailing: true,
      ),
      BSheetItemWidget(
        title: commands[4],
        onTap: () {},
        haveLeading: false,
        haveTrailing: true,
      ),
      BSheetItemWidget(
        title: commands[5],
        onTap: () {},
        haveLeading: true,
        leading: SvgPicture.asset(Assets.icons.folder),
        haveTrailing: true,
      ),
      BSheetItemWidget(
        title: commands[6],
        onTap: () {},
        haveLeading: true,
        haveTrailing: true,
        leading: SvgPicture.asset(
          Assets.icons.trash,
          color: AppColors.metalColor,
        ),
      ),
      const SizedBox(height: 60),
    ]
      // List.generate(
      //   commands.length,
      //   (index) =>  BSheetItemWidget(
      //     title: commands[index],
      //     onTap: () {},
      //     haveLeading: false,
      //     haveTrailing: true,
      //   ),
      // ),
    );
  }
}