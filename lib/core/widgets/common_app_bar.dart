import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopsy/core/constants/color_const.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String title;
  final IconData? iconData;
  const CommonAppBar({
    super.key,
    required this.height,
    required this.title,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      height: height,
      decoration: BoxDecoration(
        color: ColorConst.secondary,
        boxShadow: [
          BoxShadow(
            color: ColorConst.secondary.withValues(alpha: 0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          mainAxisAlignment: iconData != null
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            SizedBox(width: 15),
            Text(
              title,
              style: TextStyle(color: ColorConst.white, fontSize: 18.sp),
            ),
            Icon(iconData, color: ColorConst.primary),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height.h);
}
