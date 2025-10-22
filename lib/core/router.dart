import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:shopsy/core/constants/string_constants.dart';

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
    ],
  );

  GoRouter get router => _router;
}
