import 'package:flutter/material.dart';

abstract class AppTextStyles {
  const AppTextStyles._();

  static const String fontFamily = 'Inter';

  static const TextStyle h1 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    fontSize: 28.0,
    height: 40 / 28,
  );

  static const TextStyle h2 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 24.0,
    height: 26 / 24,
  );

  static const TextStyle h3 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 20.0,
    height: 26 / 20,
  );

  static const TextStyle b1Medium = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 17.0,
    height: 20 / 17,
  );

  static const TextStyle b1Regular = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 17.0,
    height: 24 / 17,
  );

  static const TextStyle b2DemiBold = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    fontSize: 15.0,
    height: 22 / 15,
  );

  static const TextStyle b2Medium = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 15.0,
    height: 22.0 / 15,
  );

  static const TextStyle b3DemiBold = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    fontSize: 13.0,
    height: 18 / 13,
  );

  static const TextStyle b3Medium = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 13.0,
    height: 15 / 13,
  );

  static const TextStyle b4Medium = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 12.0,
    height: 16 / 12,
  );
}
