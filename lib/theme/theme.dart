import 'package:effective_flutter_lab/theme/app_colors.dart';
import 'package:flutter/material.dart';

final themeData = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
  appBarTheme: AppBarTheme(
    color: const Color.fromARGB(255, 255, 244, 244),
    elevation: 0,
  ),
  scaffoldBackgroundColor: const Color.fromARGB(255, 255, 244, 244),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      fixedSize: Size(116, 24),
    ),
  ),
  iconTheme: IconThemeData(color: Colors.white),
  textTheme: TextTheme(
    bodySmall: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: AppColors.whiteColor,
    ),
    bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    titleLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
  ),
);
