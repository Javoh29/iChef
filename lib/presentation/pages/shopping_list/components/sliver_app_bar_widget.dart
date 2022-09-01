import 'package:flutter/material.dart';
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
