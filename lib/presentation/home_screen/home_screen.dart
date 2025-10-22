import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:shopsy/core/widgets/common_app_bar.dart';
import 'package:shopsy/core/widgets/common_button.dart';
import 'package:shopsy/core/widgets/product_tile/product_tile.dart';
import 'package:shopsy/data/model/product_model.dart';
import 'package:shopsy/presentation/cart_screen/cart_cubit/cart_cubit.dart';
import 'package:shopsy/presentation/home_screen/cubit/home_cubit.dart';

import '../../core/constants/string_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetIt.instance<HomeCubit>()..fetchProducts(),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CommonAppBar(
                  onTap: () {
                    context.go(StringConst.cart);
                  },
                  height: 80,
                  title: 'Shopsy',
                  iconData: Icons.shopping_cart,
                  isHome: true,
                ),
                SizedBox(height: 25.h),

                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is HomeLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state is HomeProductLoadedST) {
                      List<ProductModel> products = state.products;

                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    context.go(
                                      StringConst.product,
                                      extra: products[index],
                                    );
                                  },
                                  child: ProductTile(
                                    productModel: products[index],
                                    addToCart: () {
                                      GetIt.instance<CartCubit>().addToCart(
                                        products[index],
                                      );
                                    },
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 20.h);
                              },
                              itemCount: products.length,
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            child: CommonButton(
                              onTap: () {
                                (state.hasMore)
                                    ? context.read<HomeCubit>().loadMore()
                                    : null;
                              },
                              title: (state.hasMore)
                                  ? 'Load More'
                                  : 'Nothing more to show',
                            ),
                          ),
                        ],
                      );
                    }
                    return SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
