import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiceFour extends StatelessWidget {
  final Color? color;
  const DiceFour({super.key, this.color});

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
