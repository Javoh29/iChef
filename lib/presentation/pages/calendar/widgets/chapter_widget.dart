import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ichef/config/constants/app_decorations.dart';
import 'package:ichef/config/constants/assets.dart';

class ChapterWidget extends StatelessWidget {
  const ChapterWidget({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title),
              const SizedBox(width: 6),
              SvgPicture.asset(Assets.icons.icInfo)
            ],
          ),
        ),
        Container(
          height: 80,
          padding: const EdgeInsets.only(top: 18, bottom: 10),
          margin: const EdgeInsets.only(bottom: 20),
          decoration: AppDecorations.defDecor,
          child: child,
        ),
      ],
    );
  }
}
