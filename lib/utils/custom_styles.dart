
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultMargin = 24.0;
double defaultRadius = 8.0;
double maxHeight(context) => MediaQuery.of(context).size.height;
double maxWidth(context) => MediaQuery.of(context).size.width;

Color primaryColor = Color(0xff293155);
Color secondaryColor = Color(0xff5291B7);
Color formColor = Color(0xffEDEDED);
Color backgroundColor = Color(0xffFFFFFF);
Color blackColor = Color(0xff000000);
Color whiteColor = Color(0xffffffff);
Color greyColor = Color(0xff757575);
Color greyNavBottomColor = Color(0xffB7B7B7);
Color greyBackgroundColor = Color(0xffF7F7F7);

TextStyle primaryTextStyle = GoogleFonts.inter(
  color: primaryColor
);

TextStyle secondaryTextStyle = GoogleFonts.inter(
  color: secondaryColor
);

TextStyle blackTextStyle = GoogleFonts.inter(
  color: blackColor
);

TextStyle whiteTextStyle = GoogleFonts.inter(
    color: whiteColor
);

TextStyle greyTextStyle = GoogleFonts.inter(
  color: greyColor
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;