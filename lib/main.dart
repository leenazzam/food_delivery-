import 'package:flutter/material.dart';
import 'package:food/utils/appcolors.dart';
import 'package:food/views/pages/coustom_bottom_navbar.dart';
import 'package:food/views/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 34, 255, 71)),
        useMaterial3: true,
      ),
      home: const CoustomBottomNavbar(),
    );
  }
}
