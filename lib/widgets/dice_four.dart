import 'package:flutter/material.dart';

class DiceFour extends StatelessWidget {
  final Color? color;
  const DiceFour({super.key, this.color});

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.circle,
                color: Colors.black,
              ),
              Icon(
                Icons.circle,
                color: Colors.black,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.circle,
                color: Colors.black,
              ),
              Icon(
                Icons.circle,
                color: Colors.black,
              ),
            ],
          )
        ],
      ),
    );
  }
}
