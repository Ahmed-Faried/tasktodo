import 'package:flutter/material.dart';

import 'size_config.dart';

abstract class AppStyles {

  static const  TextStyle  styleDMSansRegular12 = TextStyle(
      color: Color(0xFF6E6A7C),
      fontSize: 12,
      fontFamily: 'DM Sans',
      fontWeight: FontWeight.w400,
      height: 0.18,
    );
  static const TextStyle styleDMSansRegular14 = TextStyle(
      color: Color(0xFF7F7F7F),
      fontSize: 14,
      fontFamily: 'DM Sans',
      fontWeight: FontWeight.w400,
    );
  static const TextStyle styleDMSansRegular16 = TextStyle(
      color: Color(0xFF7F7F7F),
      fontSize: 14,
      fontFamily: 'DM Sans',
      fontWeight: FontWeight.w400,
      // height: 0.10,
      letterSpacing: 0.20,
    );

  static const TextStyle styleDMSansMedium12 = TextStyle(
      color: Color(0xFF5F33E1),
      fontSize: 12,
      fontFamily: 'DM Sans',
      fontWeight: FontWeight.w500,
    );

  static const TextStyle styleDMSansBold16 = TextStyle(
      color: Color(0xFF7F7F7F),
      fontSize: 16,
      fontFamily: 'DM Sans',
      fontWeight: FontWeight.w700,
    );
  static const TextStyle styleDMSansBold18 =TextStyle(
      color: Color(0xFF7F7F7F),
      fontSize: 18,
      fontFamily: 'DM Sans',
      fontWeight: FontWeight.w700,

    );
  static const TextStyle styleDMSansBold19 = TextStyle(
      color: Color(0xffFFFFFF),
      fontSize: 19,
      fontFamily: 'DM Sans',
      fontWeight: FontWeight.w700,
    );
  static const TextStyle styleDMSansBold24 = TextStyle(
      color: Color(0xff24252C),
      fontSize: 24,
      fontFamily: 'DM Sans',
      fontWeight: FontWeight.w700,

    );


}

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.2;
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.breakPointFont) {
    return width / 750;
  } else if (width < SizeConfig.desktop) {
    return width / 1024;
  } else {
    return width / 1920;
  }
}
