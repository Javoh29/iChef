import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    Key? key,
    required this.mHeight,
    required this.mBgColor,
    required this.mPadding,
    required this.mBorderRadius,
    required this.mAppBar,
    required this.mBody,
  }) : super(key: key);
  final double mHeight;
  final Color? mBgColor;
  final EdgeInsets mPadding;
  final BorderRadius mBorderRadius;
  final Widget? mAppBar;
  final Widget mBody;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: mHeight,
      padding: mPadding,
      decoration: BoxDecoration(
        color: mBgColor,
        borderRadius: mBorderRadius,
      ),
      child: Material(
        color: Colors.transparent,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            mAppBar ?? const SizedBox.shrink(),
            mBody,
          ],
        ),
      ),
    );
  }
}
