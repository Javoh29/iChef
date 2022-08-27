import 'package:flutter/material.dart';
import 'package:ichef/config/constants/app_colors.dart';
import 'package:ichef/config/constants/app_decorations.dart';
import 'package:ichef/config/constants/app_text_styles.dart';
import 'package:ichef/presentation/pages/settings/user_prefrences_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const UserPrefrencesPage())),
        style: AppDecorations.buttonStyle(),
        child: Text(
          'User Prefrences',
          style: AppTextStyles.h5.copyWith(color: AppColors.baseLight.shade100),
        ),
      ),
    );
  }
}
