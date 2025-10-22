import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shopsy/core/constants/color_const.dart';
import 'package:shopsy/core/constants/string_constants.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String title;
  final IconData? iconData;
  final Function()? onTap;
  final bool isHome;
  const CommonAppBar({
    super.key,
    required this.height,
    required this.title,
    this.iconData,
    this.onTap,
    required this.isHome,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            !isHome
                ? IconButton(
                    color: ColorConst.primary,
                    onPressed: () {
                      if (GoRouter.of(context).canPop()) {
                        context.pop();
                      } else {
                        context.go(StringConst.home); // fallback to home
                      }
                    },
                    icon: Icon(CupertinoIcons.arrow_left),
                  )
                : SizedBox(),
            Text(
              title,
              style: TextStyle(color: ColorConst.white, fontSize: 18.sp),
            ),
            IconButton(
              color: ColorConst.primary,
              onPressed: () {
                onTap!();
              },
              icon: Icon(iconData),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height.h);
}
