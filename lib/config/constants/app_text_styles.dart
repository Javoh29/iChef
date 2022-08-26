import 'package:flutter/material.dart';
import 'package:ichef/config/constants/app_colors.dart';

abstract class AppTextStyles {
  const AppTextStyles._();

  static const String fontFamily = 'Inter';

  static TextStyle h1 = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: 28.0,
      height: 40 / 28,
      color: AppColors.metalColor.shade100);

  static TextStyle h2 = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: 24.0,
      height: 26 / 24,
      color: AppColors.metalColor.shade100);

  static TextStyle h3 = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: 20.0,
      height: 26 / 20,
      color: AppColors.metalColor.shade100);

  static TextStyle h4 = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      fontSize: 18.0,
      height: 24 / 18,
      color: AppColors.metalColor.shade100);

  static TextStyle h5 = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 14.0,
      height: 24 / 17,
      color: AppColors.metalColor.shade100);

  static TextStyle h6 = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      fontSize: 11.0,
      height: 22 / 11,
      color: AppColors.metalColor.shade10);

  static TextStyle h7 = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: 18.0,
      height: 24 / 18,
      color: AppColors.metalColor.shade100);

  static TextStyle b1Medium = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: 17.0,
      height: 20 / 17,
      color: AppColors.metalColor.shade100);

  static TextStyle b1Regular = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 17.0,
      height: 24 / 17,
      color: AppColors.metalColor.shade100);

  static TextStyle b2DemiBold = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: 15.0,
      height: 22 / 15,
      color: AppColors.metalColor.shade100);

  static TextStyle b2Medium = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: 15.0,
      height: 22.0 / 15,
      color: AppColors.metalColor.shade100);

  static TextStyle b3DemiBold = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: 13.0,
      height: 18 / 13,
      color: AppColors.metalColor.shade100);

  static TextStyle b4DemiBold = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: 14.0,
      height: 20 / 14,
      color: AppColors.metalColor.shade100);

  static TextStyle b5DemiBold = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: 14.0,
      height: 20 / 14,
      color: AppColors.metalColor.shade100);

  static TextStyle b3Medium = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: 13.0,
      height: 15 / 13,
      color: AppColors.metalColor.shade100);

  static TextStyle b4Medium = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: 12.0,
      height: 16 / 12,
      color: AppColors.metalColor.shade100);

  static TextStyle b4Regular = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 12.0,
      height: 16 / 12,
      color: AppColors.metalColor.shade100);

  static TextStyle b5Regular = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 14.0,
      height: 16 / 12,
      color: AppColors.metalColor.shade100);
}
