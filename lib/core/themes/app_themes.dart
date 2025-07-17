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
}

ThemeData appTheme = ThemeData(scaffoldBackgroundColor: Colors.white);
