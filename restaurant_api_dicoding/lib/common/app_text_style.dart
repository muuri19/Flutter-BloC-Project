import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_color.dart';

class AppTextStyles {
  static final TextStyle heading1 = GoogleFonts.poppins(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: AppColors.onBackgroundColor,
  );

  static final TextStyle heading2 = GoogleFonts.poppins(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: AppColors.onBackgroundColor,
  );

  static final TextStyle bodyText1 = GoogleFonts.poppins(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: AppColors.onBackgroundColor,
  );

  static final TextStyle bodyText2 = GoogleFonts.poppins(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: AppColors.onBackgroundColor,
  );

  static final TextStyle caption = GoogleFonts.poppins(
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
    color: AppColors.onBackgroundColor,
  );
}
