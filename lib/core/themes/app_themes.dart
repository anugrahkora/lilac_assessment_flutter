import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lilac_assessment_flutter/core/constants/app_colors/app_colors.dart';

class AppTextStyles {
  static TextStyle button1 = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    color: AppTextColors.button1Color,
  );
  static TextStyle body1 = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: AppTextColors.body1Color,
  );
  static TextStyle heading2 = GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    fontSize: 20,
    color: AppTextColors.darkGrey,
  );
  static TextStyle subHeading1 = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 17,
    color: AppTextColors.darkGrey,
  );
  static TextStyle caption = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 10,
    color: AppTextColors.darkGrey,
  );
}

ThemeData appTheme = ThemeData(scaffoldBackgroundColor: Colors.white);
