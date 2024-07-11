import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RollingDice extends StatelessWidget {
  final int diceNumber;
  const RollingDice({super.key, required this.diceNumber});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/$diceNumber.webp',
      width: 30.w,
      height: 70.h,
    );
  }
}
