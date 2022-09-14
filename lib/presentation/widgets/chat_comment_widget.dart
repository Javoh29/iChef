import 'package:flutter/material.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_decorations.dart';
import '../../config/constants/app_text_styles.dart';
import '../../config/constants/assets.dart';

// ignore: must_be_immutable
class ChatCommentWidget extends StatefulWidget {
  ChatCommentWidget({
    Key? key,
    this.userName,
    this.userImage,
    this.lastSeen,
    this.time,
    this.chatText,
    this.isOwner,
  }) : super(key: key);
  String? userName;
  String? userImage;
  String? lastSeen;
  String? time;
  String? chatText;
  bool? isOwner;

  @override
  State<ChatCommentWidget> createState() => _ChatCommentWidgetState();
}

class _ChatCommentWidgetState extends State<ChatCommentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 4),
          child: Row(
            children: [
              Container(
                width: 34,
                height: 34,
                margin: const EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(widget.userImage!),
                  ),
                ),
              ),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    text: widget.userName,
                    style: AppTextStyles.b4Medium
                        .copyWith(color: AppColors.metalColor.shade100, fontWeight: FontWeight.w700),
                    children: [
                      TextSpan(
                        text: ' · ',
                        style: AppTextStyles.b4Regular.copyWith(color: AppColors.metalColor.shade50),
                        children: [
                          TextSpan(text: widget.lastSeen),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                widget.time!,
                style: AppTextStyles.h5.copyWith(color: AppColors.metalColor.shade100, fontSize: 12),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.metalColor.shade10,
          ),
          child: Text(
            widget.chatText!,
            style: AppTextStyles.h5,
          ),
        ),
        widget.isOwner!
            ? Row(
                children: [
                  Image(
                    image: AssetImage(Assets.images.smile),
                    width: 16,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextButton(
                            onPressed: () {},
                            style: AppDecorations.buttonStyle(
                                bgColor: AppColors.baseLight.shade100,
                                border: BorderSide(color: AppColors.primaryLight.shade100, width: 1),
                                borderRadius: 15),
                            child: Text(
                              '😎 112',
                              style: AppTextStyles.b4Medium.copyWith(
                                color: AppColors.primaryLight.shade100,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          style: AppDecorations.buttonStyle(
                              bgColor: AppColors.baseLight.shade100,
                              border: BorderSide(color: AppColors.primaryLight.shade100, width: 1),
                              borderRadius: 15),
                          child: Text(
                            '😍 1',
                            style: AppTextStyles.b4Medium.copyWith(
                              color: AppColors.primaryLight.shade100,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Изменить",
                    style: AppTextStyles.h5.copyWith(color: AppColors.metalColor.shade100, fontSize: 12),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    "Удалить",
                    style: AppTextStyles.h5.copyWith(color: AppColors.metalColor.shade100, fontSize: 12),
                  ),
                ],
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
