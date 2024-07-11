import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiceThree extends StatelessWidget {
  final Color? color;
  const DiceThree({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35.w,
      height: 87.h,
      padding: EdgeInsets.all(2.sp),
      decoration: BoxDecoration(
          color: color ?? Colors.white,
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(10.r))),
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
            alignment: Alignment.center,
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
