import 'package:flutter/material.dart';

class DiceOne extends StatelessWidget {
  final Color? color;
  const DiceOne({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 87,
      height: 87,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: color ?? Colors.white,
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: const Center(
        child: Icon(
          Icons.circle,
          color: Colors.red,
        ),
      ),
    );
  }
}
