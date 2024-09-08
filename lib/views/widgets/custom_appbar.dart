import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/utils/appcolors.dart';
import 'package:food/views/pages/cart_page.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context).push(CupertinoPageRoute(builder: (_) {
                return CartPage();
              }));
            },
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.black,
            )),
      ],
      centerTitle: true,
      title: const Center(
        child: Column(
          children: [
            const Text(
              "Current Location",
              style: TextStyle(
                fontSize: 10,
                color: AppColors.grey,
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                Icons.location_on,
                color: AppColors.green,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                'Hebron,Palestine',
                style: TextStyle(fontSize: 17),
              )
            ])
          ],
        ),
      ),
    );
  }
}
