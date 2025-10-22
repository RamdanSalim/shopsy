import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shopsy/core/constants/color_const.dart';
import 'package:shopsy/core/widgets/common_app_bar.dart';
import 'package:shopsy/core/widgets/common_button.dart';
import 'package:shopsy/core/widgets/product_tile/widgets/selector_tile.dart';
import 'package:shopsy/data/model/product_model.dart';
import '../../core/constants/string_constants.dart';
import '../../core/di.dart';
import '../cart_screen/cart_cubit/cart_cubit.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductModel productModel;

  const ProductDetailPage({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CartCubit, CartState>(
          bloc: cartCubit,
          builder: (context, state) {
            final cartItem = state.cartItems.firstWhere(
              (item) => item.id == productModel.id,
              orElse: () => productModel.copyWith(stock: 0),
            );
            final quantity = cartItem.stock ?? 0;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonAppBar(
                    onTap: () {
                      context.push(StringConst.cart);
                    },
                    height: 80,
                    title: 'Shopsy',
                    iconData: Icons.shopping_cart,
                    isHome: false,
                  ),
                  Container(
                    width: double.infinity,
                    height: 250.h,
                    decoration: BoxDecoration(
                      color: ColorConst.grey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        productModel.name!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productModel.name!,
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.star_fill,
                              color: ColorConst.primary,
                              size: 18,
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              productModel.rating!.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              productModel.category!,
                              style: TextStyle(
                                color: ColorConst.secondary.withValues(
                                  alpha: 0.6,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),

                        Text(
                          productModel.description!,
                          style: TextStyle(fontSize: 16.sp),
                        ),
                        SizedBox(height: 16.h),

                        Text(
                          "₹${productModel.price}",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorConst.secondary,
                          ),
                        ),
                        SizedBox(height: 24.h),
                      ],
                    ),
                  ),
                  Center(
                    child: quantity > 0
                        ? SizedBox(
                            width: 210.w,
                            child: SelectorTile(
                              count: quantity,
                              add: () => cartCubit.changeQuantity(
                                productModel.id!,
                                increment: true,
                              ),
                              remove: () => cartCubit.changeQuantity(
                                productModel.id!,
                                increment: false,
                              ),
                            ),
                          )
                        : CommonButton(
                            onTap: () {
                              cartCubit.addToCart(productModel);
                            },
                            title: 'ADD TO CART',
                          ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
