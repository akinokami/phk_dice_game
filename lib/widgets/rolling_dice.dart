import 'package:flutter/material.dart';

class RollingDice extends StatelessWidget {
  final int diceNumber;
  const RollingDice({super.key, required this.diceNumber});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/$diceNumber.webp',
      width: 70.0,
      height: 70.0,
    );
  }
}
