import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/models/product_model.dart';
import 'package:food/utils/appcolors.dart';

class CounterWidget extends StatefulWidget {
  final ProductModel product;
  const CounterWidget({super.key, required this.product});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  late int counter;
  @override
  void initState() {
    super.initState();
    counter = widget.product.count;
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.grey2),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: [
          IconButton(
              onPressed: counter > 1
                  ? () {
                      setState(() {
                        counter--;
                        widget.product.count = counter;
                      });
                    }
                  : null,
              icon: const Icon(Icons.remove)),
          const SizedBox(
            width: 8,
          ),
          Text('$counter'),
          const SizedBox(
            width: 8,
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  counter++;
                  widget.product.count = counter;
                });
              },
              icon: const Icon(Icons.add)),
        ],
      ),
    );
  }
}
