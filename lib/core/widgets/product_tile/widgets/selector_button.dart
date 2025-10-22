import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/color_const.dart';

class SelectorButton extends StatelessWidget {
  final Function() onClicked;
  final IconData iconData;
  const SelectorButton({
    super.key,
    required this.onClicked,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClicked();
      },
      child: Container(
        decoration: BoxDecoration(
          color: ColorConst.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        constraints: BoxConstraints(
          maxWidth: 50.w,
          maxHeight: 40.h,
          minHeight: 25.h,
          minWidth: 50.w,
        ),
        child: Center(child: Icon(iconData, color: ColorConst.white)),
      ),
    );
  }
}
