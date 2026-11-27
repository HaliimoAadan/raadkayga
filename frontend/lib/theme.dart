import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const sky = Color(0xFF2F7FD8);      // Somali flag blue
  static const ink = Color(0xFF12355B);      // text
  static const orange = Color(0xFFF08A24);   // buttons
  static const redEarth = Color(0xFFC2552F); // the red sand
  static const cream = Color(0xFFFFFDF7);    // page background
}

TextStyle heading(double size, {Color color = AppColors.ink}) => GoogleFonts.baloo2(
      fontSize: size,
      fontWeight: FontWeight.w800,
      height: 1.05,
      color: color,
    );

ThemeData buildTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.sky, primary: AppColors.sky),
    scaffoldBackgroundColor: AppColors.cream,
    textTheme: GoogleFonts.nunitoTextTheme().apply(
      bodyColor: AppColors.ink,
      displayColor: AppColors.ink,
    ),
  );
}