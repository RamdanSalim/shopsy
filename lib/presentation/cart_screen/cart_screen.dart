import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopsy/core/constants/color_const.dart';
import 'package:shopsy/core/widgets/common_app_bar.dart';
import 'package:shopsy/core/widgets/common_button.dart';
import 'package:shopsy/core/widgets/product_tile/widgets/selector_tile.dart';

import '../../core/di.dart';
import 'cart_cubit/cart_cubit.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CartCubit, CartState>(
        bloc: cartCubit,
        builder: (context, state) {
          if (state.cartItems.isEmpty) {
            return Column(
              children: [
                CommonAppBar(height: 60, title: "Your Cart", isHome: false),
                const Expanded(
                  child: Center(child: Text("Your cart is empty")),
                ),
              ],
            );
          }

          return Column(
            children: [
              CommonAppBar(height: 60, title: "Your Cart", isHome: false),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.all(10.w),
                  itemCount: state.cartItems.length,
                  separatorBuilder: (_, __) => SizedBox(height: 10.h),
                  itemBuilder: (context, index) {
                    final product = state.cartItems[index];
                    return Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: ColorConst.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: ColorConst.secondary.withValues(alpha: 0.2),
                            blurRadius: 5,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text("₹${product.price}"),
                              ],
                            ),
                          ),

                          SelectorTile(
                            count: product.stock!,
                            add: () => cartCubit.changeQuantity(
                              product.id!,
                              increment: true,
                            ),
                            remove: () => cartCubit.changeQuantity(
                              product.id!,
                              increment: false,
                            ),
                          ),

                          product.stock! >= 2
                              ? IconButton(
                                  icon: const Icon(
                                    CupertinoIcons.trash,
                                    color: Colors.red,
                                  ),
                                  onPressed: () =>
                                      cartCubit.removeFromCart(product.id!),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // Total & Checkout
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                decoration: BoxDecoration(
                  color: ColorConst.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.2),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total: ₹${state.totalAmount.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    CommonButton(onTap: () => null, title: 'Check out'),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
