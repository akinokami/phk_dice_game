import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiceSix extends StatelessWidget {
  final Color? color;
  const DiceSix({super.key, this.color});

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.circle,
                color: Colors.black,
                size: 10.sp,
              ),
              Icon(
                Icons.circle,
                color: Colors.black,
                size: 10.sp,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.circle,
                color: Colors.black,
                size: 10.sp,
              ),
              Icon(
                Icons.circle,
                color: Colors.black,
                size: 10.sp,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.circle,
                color: Colors.black,
                size: 10.sp,
              ),
              Icon(
                Icons.circle,
                color: Colors.black,
                size: 10.sp,
              ),
            ],
          )
        ],
      ),
    );
  }
}
