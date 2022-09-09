import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ichef/config/constants/app_colors.dart';
import 'package:ichef/config/constants/app_text_styles.dart';
import 'package:ichef/config/constants/assets.dart';
import 'package:ichef/presentation/routes/routes.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1500),
        () => Navigator.pushNamedAndRemoveUntil(context, Routes.mainPage, (_) => false));
    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.icons.appLogoSvg,
              height: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'iChef Expert',
              style: AppTextStyles.h3.copyWith(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
