import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopsy/core/constants/color_const.dart';
import 'package:shopsy/data/model/product_model.dart';

class ProductTile extends StatelessWidget {
  final Function() addToCart;
  final ProductModel productModel;
  const ProductTile({
    super.key,
    required this.productModel,
    required this.addToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConst.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: ColorConst.secondary.withValues(alpha: 0.3),
            offset: Offset(3, 0),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              constraints: BoxConstraints(
                maxHeight: 100.h,
                maxWidth: 120.w,
                minHeight: 80.h,
                minWidth: 100.w,
              ),
              decoration: BoxDecoration(
                color: ColorConst.grey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: Text(
                    productModel.name!,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 210.w,
                  child: Text(
                    productModel.description!,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${productModel.category!} | ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorConst.secondary.withValues(alpha: 0.5),
                        ),
                      ),

                      SizedBox(width: 5.w),
                      Text(
                        productModel.rating!.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 2.w),
                      Icon(
                        CupertinoIcons.star_fill,
                        color: ColorConst.primary,
                        size: 16,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    addToCart();
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
                        'ADD TO CART',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorConst.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
