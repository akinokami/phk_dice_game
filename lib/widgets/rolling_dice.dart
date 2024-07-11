import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RollingDice extends StatelessWidget {
  final int diceNumber;
  const RollingDice({super.key, required this.diceNumber});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/$diceNumber.webp',
      width: 1.sw * 0.08,
      height: 1.sh * 0.15,
    );
  }
}
