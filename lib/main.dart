import 'package:flutter/material.dart';
import 'package:food/utils/app_theme.dart';
import 'package:food/utils/appcolors.dart';
import 'package:food/views/pages/custom_bottom_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery',
      theme: AppTheme.lightTheme(),
      home: const CustomBottomNavbar(),
    );
  }
}
