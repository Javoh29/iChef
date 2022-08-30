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
      color: AppColors.metalColor.shade100);

  static TextStyle h2 = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: 24.0,
      color: AppColors.metalColor.shade100);

  static TextStyle h3 = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: 20.0,
      color: AppColors.metalColor.shade100);

  static TextStyle h4 = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      fontSize: 18.0,
      color: AppColors.metalColor.shade100);

  static TextStyle h5 = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 14.0,
      color: AppColors.metalColor.shade100);

  static TextStyle h6 = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      fontSize: 11.0,
      color: AppColors.metalColor.shade10);

  static TextStyle h7 = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: 18.0,
      color: AppColors.metalColor.shade100);

  static TextStyle h8 = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: 16.0,
      color: AppColors.metalColor.shade100);

  static TextStyle b1Medium = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: 17.0,
      color: AppColors.metalColor.shade100);

  static TextStyle b1Regular = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 17.0,
      color: AppColors.metalColor.shade100);

  static TextStyle b2DemiBold = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: 15.0,
      color: AppColors.metalColor.shade100);

  static TextStyle b2Medium = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: 15.0,
      color: AppColors.metalColor.shade100);

  static TextStyle b5Medium = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: 14.0,
      color: AppColors.metalColor.shade100);

  static TextStyle b3DemiBold = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: 13.0,
      color: AppColors.metalColor.shade100);

  static TextStyle b4DemiBold = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: 14.0,
      color: AppColors.metalColor.shade100);

  static TextStyle b5DemiBold = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: 14.0,
      color: AppColors.metalColor.shade100);
  static TextStyle b6DemiBold = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: 17.0,
      color: AppColors.metalColor.shade100);

  static TextStyle b3Medium = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: 13.0,
      color: AppColors.metalColor.shade100);

  static TextStyle b4Medium = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: 12.0,
      color: AppColors.metalColor.shade100);

  static TextStyle b4Regular = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 12.0,
      color: AppColors.metalColor.shade100);

  static TextStyle b5Regular = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 14.0,
      color: AppColors.metalColor.shade100);
}
