import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiceOne extends StatelessWidget {
  final Color? color;
  const DiceOne({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35.w,
      height: 87.h,
      decoration: BoxDecoration(
          color: color ?? Colors.white,
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(10.r))),
      child: const Center(
        child: Icon(
          Icons.circle,
          color: Colors.red,
        ),
      ),
    );
  }
}
