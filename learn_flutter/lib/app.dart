import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_flutter/flavors.dart';
import 'package:learn_flutter/routes/app_routes.dart';
import 'package:learn_flutter/routes/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
    title: Flavors.title,
    debugShowCheckedModeBanner: false,
    builder: (context, child) => Material(child: child),
    navigatorObservers: [ChuckerFlutter.navigatorObserver],
    getPages: AppRoutes().routes,
    initialRoute: Routes.splashPage,
  );
}
