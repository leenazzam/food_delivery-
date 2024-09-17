import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/utils/appcolors.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
        ),
        body: const SafeArea(
            child: Column(
          children: [Text('orders')],
        )));
  }
}
