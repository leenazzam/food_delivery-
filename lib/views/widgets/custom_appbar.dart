import 'package:flutter/material.dart';
import 'package:food/utils/appcolors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_outlined)),
      ],
      centerTitle: true,
      title: const Center(
        child: Column(
          children: [
            const Text(
              "Current Location",
              style: TextStyle(
                fontSize: 14,
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
                style: TextStyle(fontSize: 20),
              )
            ])
          ],
        ),
      ),
    );
  }
}
