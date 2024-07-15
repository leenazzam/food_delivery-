import 'package:flutter/material.dart';
import 'package:food/utils/appcolors.dart';
import 'package:food/views/pages/home_page.dart';
import 'package:food/views/widgets/app_drawer.dart';
import 'package:food/views/widgets/custom_appbar.dart';

class CoustomBottomNavbar extends StatefulWidget {
  const CoustomBottomNavbar({super.key});

  @override
  State<CoustomBottomNavbar> createState() => _CoustomBottomNavbarState();
}

class _CoustomBottomNavbarState extends State<CoustomBottomNavbar> {
  int selectedIndex = 0;
  List<Widget> bodyWidgets = [
    HomePage(),
    SizedBox(),
    SizedBox(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey100,
      drawer: const AppDrawer(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: CustomAppBar(),
      ),
      body: SafeArea(
        child: bodyWidgets[selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primary,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
        ],
      ),
    );
  }
}
