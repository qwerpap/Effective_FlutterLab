import 'package:effective_flutter_lab/ui/app_colors.dart';
import 'package:flutter/material.dart';

final themeData = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
  textTheme: TextTheme(
    bodyMedium: TextStyle(fontWeight: FontWeight.w400),
  ), //14px
);
