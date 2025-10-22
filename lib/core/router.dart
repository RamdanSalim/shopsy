import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopsy/core/constants/string_constants.dart';
import 'package:shopsy/data/model/product_model.dart';
import 'package:shopsy/presentation/cart_screen/cart_screen.dart';
import 'package:shopsy/presentation/product_screen/product_detail_screen.dart';

import '../presentation/home_screen/home_screen.dart';
import '../presentation/splash_screen/splash_screen.dart';
import 'di.dart';

class AppRouter {
  final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: StringConst.splash,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: StringConst.home,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: StringConst.cart,
        builder: (BuildContext context, GoRouterState state) {
          return const CartScreen();
        },
      ),
      GoRoute(
        path: StringConst.product,
        builder: (BuildContext context, GoRouterState state) {
          final productId = state.extra! as int;

          //type safe for web
          return FutureBuilder<List<ProductModel>>(
            future: prodRepo.loadProduct(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              final products = snapshot.data!;
              final product = products.firstWhere((p) => p.id == productId);

              return ProductDetailPage(productModel: product);
            },
          );
        },
      ),
    ],
  );

  GoRouter get router => _router;
}
