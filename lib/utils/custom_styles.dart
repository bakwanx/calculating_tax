import 'package:flutter/material.dart';

class CustomColor {
  CustomColor._();
  static Color primaryColor = Color(0xff01AA4F);
  static Color secondaryColor = Color(0xff4ECB71);
  static Color tertiaryColor = Color(0xffFFB507);
  static Color quaternary = Color(0xff049587);
  static Color alertColor = Color(0xffEF5350);
  static Color formColor = Color(0xffEAEAEA);
  static Color backgroundColor1 = Color(0xffFEFEFE);
  static Color backgroundColor2 = Color(0xffFAFAFA);
  static Color chatBubleColor = Color(0xffF3F3F3);
  static Color primaryTextColor = Color(0xff000000);
  static Color iconNavBottomColor = Color(0xffDCDCDC);
  static Color secondaryTextColor = Color(0xff969596);
  static Color subtitleTextQuran = Color(0xff555555);
  static Color grey = Color(0xff555555);
}

class SizeScreen {
  static double maxHeight(BuildContext context) => MediaQuery.of(context).size.height;
  static double maxWidth(BuildContext context) => MediaQuery.of(context).size.width;
}

class DefaultSize {
  static double defaultMargin = 24.0;
  static double defaultRadius = 8.0;
}

class Typo {
  static final TextStyle _defaultStyle = TextStyle(
    fontFamily: 'proxima',
  );

  static final TextStyle _heading = _defaultStyle.copyWith(
    fontWeight: FontWeight.w700,
  );

  static TextStyle h1 = _heading.copyWith(fontSize: 32);
  static TextStyle h2 = _heading.copyWith(fontSize: 24);
  static TextStyle h3 = _heading.copyWith(fontSize: 18);
  static TextStyle h4 = _heading.copyWith(fontSize: 16);
  static TextStyle h5 = _heading.copyWith(fontSize: 10);

  static TextStyle body = _defaultStyle.copyWith(fontSize: 16);
  static TextStyle small = _defaultStyle.copyWith(fontSize: 14);
  static TextStyle caption = _defaultStyle.copyWith(fontSize: 12);

  static FontWeight light = FontWeight.w300;
  static FontWeight regular = FontWeight.w400;
  static FontWeight medium = FontWeight.w500;
  static FontWeight semiBold = FontWeight.w600;
  static FontWeight bold = FontWeight.w700;
  static FontWeight extraBold = FontWeight.w800;
  static FontWeight black = FontWeight.w900;
}