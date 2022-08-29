import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ichef/presentation/pages/shopping_list/widgets/shopping_list_app_bar.dart';

import '../../../../config/constants/app_text_styles.dart';
import '../../../../config/constants/assets.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({
    Key? key,
    required this.innerBoxIsScrolled,
    this.leading,
    this.title,
    this.actions, this.bottom,
  }) : super(key: key);
  final bool innerBoxIsScrolled;
  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      elevation: 0,
      floating: true,
      forceElevated: innerBoxIsScrolled,
      automaticallyImplyLeading: false,
      leading: leading,
      title: title,
      actions: actions,
      bottom: bottom ,
    );
  }
}
