import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ichef/config/constants/app_decorations.dart';
import 'package:ichef/config/constants/app_text_styles.dart';
import 'package:ichef/config/constants/assets.dart';

import '../../../../config/constants/app_colors.dart';

class InfoCostadoroComponent extends StatelessWidget {
  const InfoCostadoroComponent({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  final String image, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: AppDecorations.defDecor.copyWith(
        color: Colors.transparent,
        border: Border.all(
          color: AppColors.metalColor.shade30,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(image),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.b5DemiBold,
              ),
              Text(
                subtitle,
                style: AppTextStyles.h5.copyWith(
                  color: AppColors.metalColor.shade50,
                ),
              ),
            ],
          ),
          const Spacer(),
          CircleAvatar(
            radius: 15,
            child: Center(
              child: InkWell(
                onTap: () {},
                child: Transform.rotate(
                  angle: 3.14,
                  child: SvgPicture.asset(
                    Assets.icons.backArrow,
                    height: 15,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
