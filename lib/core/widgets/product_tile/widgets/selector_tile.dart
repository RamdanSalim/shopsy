import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopsy/core/widgets/product_tile/widgets/selector_button.dart';

class SelectorTile extends StatelessWidget {
  final int count;
  final Function() add, remove;
  const SelectorTile({
    super.key,
    required this.count,
    required this.add,
    required this.remove,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SelectorButton(
          onClicked: () {
            add();
          },
          iconData: count > 1 ? CupertinoIcons.minus : CupertinoIcons.trash,
        ),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          constraints: BoxConstraints(
            maxWidth: 50.w,
            maxHeight: 25.h,
            minHeight: 25.h,
            minWidth: 50.w,
          ),
          child: Center(child: Text(count.toString())),
        ),
        SelectorButton(
          iconData: CupertinoIcons.add,
          onClicked: () {
            remove();
          },
        ),
      ],
    );
  }
}
