import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/color_const.dart';

class CommonButton extends StatelessWidget {
  final Function() onTap;
  final String title;
  const CommonButton({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 40.h,
        width: 210.w,
        decoration: BoxDecoration(
          color: ColorConst.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: ColorConst.white,
            ),
          ),
        ),
      ),
    );
  }
}
