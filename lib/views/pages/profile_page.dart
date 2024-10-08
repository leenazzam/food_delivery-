import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/views/widgets/orders_coupons_widget.dart';
import 'package:food/views/widgets/profile_list_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 24.0),
              CircleAvatar(
                  radius:
                      size.width > 800 ? size.height * 0.2 : size.height * 0.1,
                  backgroundImage: const AssetImage('assets/images/img.png')),
              const SizedBox(height: 24.0),
              const Text(
                'Leen Azzam',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6.0),
              const Text(
                'Software Engineer',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black45,
                ),
              ),
              const SizedBox(height: 24.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OrdersCouponsWidget(
                    title: 'Orders',
                    value: 10,
                  ),
                  SizedBox(
                    height: 45,
                    child: VerticalDivider(),
                  ),
                  OrdersCouponsWidget(
                    title: 'Coupons',
                    value: 5,
                  ),
                ],
              ),
              const Divider(
                indent: 20,
                endIndent: 20,
              ),
              if (!Platform.isIOS) ...[
                const ProfileListTile(
                  leadingIcon: Icons.shopping_cart_outlined,
                  title: 'Orders',
                ),
                const Divider(
                  indent: 20,
                  endIndent: 20,
                ),
                const ProfileListTile(
                  leadingIcon: Icons.card_giftcard_outlined,
                  title: 'Coupons',
                ),
                const Divider(
                  indent: 20,
                  endIndent: 20,
                ),
              ] else
                CupertinoListSection(
                  children: const [
                    ProfileListTile(
                      leadingIcon: Icons.shopping_cart_outlined,
                      title: 'Orders',
                    ),
                    ProfileListTile(
                      leadingIcon: Icons.card_giftcard_outlined,
                      title: 'Coupons',
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
