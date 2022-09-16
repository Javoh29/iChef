
import 'package:flutter/material.dart';
import 'package:ichef/config/constants/app_decorations.dart';
import 'package:ichef/config/constants/app_text_styles.dart';
import 'package:ichef/config/constants/local_data.dart';

import '../../../../config/constants/app_colors.dart';

class PropertiesSubtitleItemComponent extends StatelessWidget {
  const PropertiesSubtitleItemComponent({
    Key? key,
    required this.context,
    required this.index,
  }) : super(key: key);

  final BuildContext context;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: AppDecorations.defDecor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Text(
              props[index]['title'],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.b5Medium
                  .copyWith(color: AppColors.primaryLight.shade100),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3.2,
            child: Text(
              props[index]['type'],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.b5Medium,
            ),
          ),
        ],
      ),
    );
  }
}