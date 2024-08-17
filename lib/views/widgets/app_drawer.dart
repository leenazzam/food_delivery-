import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/views/pages/home_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const Text('Home Options'),
            ListTile(
              leading: const Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                HomePage();
              },
            ),
          ],
        ),
      ),
    );
  }
}
