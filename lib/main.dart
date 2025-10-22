import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shopsy/core/router.dart';

import 'core/di.dart';

void main() {
  final appRouter = AppRouter();
  setupDI();
  runApp(
    ScreenUtilInit(
      designSize: Size(390, 844),
      minTextAdapt: true,
      builder: (context, child) {
        return MyApp(router: appRouter.router);
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  final GoRouter router;
  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Shopsy',
      debugShowCheckedModeBanner: false,
    );
  }
}
