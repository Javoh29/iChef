import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SlidableBtnWidget extends StatelessWidget {
  const SlidableBtnWidget({
    Key? key,
    this.onTap,
    required this.leftRadius,
    required this.rightRadius,
    required this.color,
    required this.icon,
  }) : super(key: key);
  final void Function()? onTap;
  final double leftRadius;
  final double rightRadius;
  final Color color;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 7,
        height: 87,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(leftRadius),
              right: Radius.circular(rightRadius)),
        ),
        child: SvgPicture.asset(
          icon,
          fit: BoxFit.none,
          height: 18,
          width: 18,
        ),
      ),
    );
  }
}
