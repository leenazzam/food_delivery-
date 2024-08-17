import 'package:flutter/material.dart';
import 'package:food/utils/appcolors.dart';

class AppTheme {
  static ThemeData lightTheme() => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          background: AppColors.grey100,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.white,
        ),
        drawerTheme: DrawerThemeData(backgroundColor: AppColors.grey100),
        useMaterial3: true,
      );
}
