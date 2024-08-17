import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/utils/appcolors.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 1;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: [
          IconButton(
              onPressed: _counter > 1
                  ? () {
                      setState(() {
                        _counter--;
                      });
                    }
                  : null,
              icon: const Icon(Icons.remove)),
          const SizedBox(
            width: 8,
          ),
          Text('$_counter'),
          const SizedBox(
            width: 8,
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  _counter++;
                });
              },
              icon: const Icon(Icons.add)),
        ],
      ),
    );
  }
}
