import 'package:flutter/cupertino.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_decorations.dart';
import '../../config/constants/app_text_styles.dart';

// ignore: must_be_immutable
class PrefrencesInfoContainer extends StatefulWidget {
  PrefrencesInfoContainer({
    required this.title,
    required this.isSwitched,
    this.textColor,
    Key? key,
  }) : super(key: key);
  String title;
  bool isSwitched;
  Color? textColor;

  @override
  State<PrefrencesInfoContainer> createState() => _PrefrencesInfoContainerState();
}

class _PrefrencesInfoContainerState extends State<PrefrencesInfoContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: AppDecorations.defDecor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: AppTextStyles.b5Medium.copyWith(color: widget.textColor ?? AppColors.primaryLight),
          ),
          CupertinoSwitch(
            value: widget.isSwitched,
            onChanged: (value) {
              setState(() {
                widget.isSwitched = !widget.isSwitched;
              });
            },
          )
        ],
      ),
    );
  }
}
