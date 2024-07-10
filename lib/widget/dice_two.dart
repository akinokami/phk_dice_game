import 'package:flutter/material.dart';

class DiceTwo extends StatelessWidget {
  final Color? color;
  const DiceTwo({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 87,
      height: 87,
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          color: color ?? Colors.white,
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Icon(
              Icons.circle,
              color: Colors.black,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Icon(
              Icons.circle,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
