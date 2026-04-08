import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_flutter/pages/home/home_page.dart';
import 'package:learn_flutter/pages/login/login_page.dart';
import 'package:learn_flutter/pages/splash/splash_page.dart';
import 'package:learn_flutter/routes/routes.dart';

class AppRoutes {
  List<GetPage> get routes => <GetPage>[
    _getPage(name: Routes.splashPage, page: () => SplashPage()),
    _getPage(name: Routes.loginPage, page: () => LoginPage()),
    _getPage(name: Routes.homePage, page: () => HomePage()),
  ];

  GetPage _getPage({required String name, required Widget Function() page}) =>
      GetPage(name: name, page: page);
}
