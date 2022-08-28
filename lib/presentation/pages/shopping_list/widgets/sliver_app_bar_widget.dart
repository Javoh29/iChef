import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ichef/presentation/pages/shopping_list/widgets/shopping_list_app_bar.dart';

import '../../../../config/constants/app_text_styles.dart';
import '../../../../config/constants/assets.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({
    Key? key,
    required this.innerBoxIsScrolled,
  }) : super(key: key);
  final bool innerBoxIsScrolled;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      pinned: true,
      floating: true,
      forceElevated: innerBoxIsScrolled,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          Assets.icons.back,
          height: 20,
        ),
      ),
      title: Text(
        'Шопинг лист',
        style: AppTextStyles.h1.copyWith(fontSize: 14),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              Assets.icons.scanner,
              height: 24,
            ),
          ),
        ),
      ],
      bottom: const ShoppingListAppBar(),
    );
  }
}
