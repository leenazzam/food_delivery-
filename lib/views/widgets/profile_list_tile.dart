import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/views/pages/coupons_page.dart';
import 'package:food/views/pages/orders_page.dart';

class ProfileListTile extends StatefulWidget {
  final IconData leadingIcon;
  final String title;
  const ProfileListTile({
    super.key,
    required this.leadingIcon,
    required this.title,
  });

  @override
  State<ProfileListTile> createState() => _ProfileListTileState();
}

class _ProfileListTileState extends State<ProfileListTile> {
  @override
  Widget build(BuildContext context) {
    return listItem();
  }

  Widget listItem() {
    return Platform.isIOS
        ? CupertinoListTile(
            onTap: () {
              Navigator.of(context).push(CupertinoPageRoute(builder: (_) {
                return widget.title == 'Orders'
                    ? const OrdersPage()
                    : CouponsPage();
              }));
            },
            leading: Icon(
              widget.leadingIcon,
              size: 30,
            ),
            title: Text(
              widget.title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
          )
        : ListTile(
            onTap: () {
              Navigator.of(context).push(CupertinoPageRoute(builder: (_) {
                return widget.title == 'Orders'
                    ? const OrdersPage()
                    : CouponsPage();
              }));n
            },
            leading: Icon(
              widget.leadingIcon,
              size: 30,
            ),
            title: Text(
              widget.title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
          );
  }
}
