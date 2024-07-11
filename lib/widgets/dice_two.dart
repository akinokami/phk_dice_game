import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiceTwo extends StatelessWidget {
  final Color? color;
  const DiceTwo({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 40.w,
      padding: EdgeInsets.all(2.sp),
      decoration: BoxDecoration(
          color: color ?? Colors.white,
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(10.r))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Icon(
              Icons.circle,
              color: Colors.black,
              size: 10.sp,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Icon(
              Icons.circle,
              color: Colors.black,
              size: 10.sp,
            ),
          ),
        ],
      ),
    );
  }
}
