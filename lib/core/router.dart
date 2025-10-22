import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:shopsy/core/constants/string_constants.dart';
import 'package:shopsy/data/model/product_model.dart';
import 'package:shopsy/presentation/cart_screen/cart_screen.dart';
import 'package:shopsy/presentation/product_screen/product_detail_screen.dart';

import '../presentation/home_screen/home_screen.dart';
import '../presentation/splash_screen/splash_screen.dart';

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
          final product = state.extra as ProductModel;
          return ProductDetailPage(productModel: product);
        },
      ),
    ],
  );

  GoRouter get router => _router;
}
