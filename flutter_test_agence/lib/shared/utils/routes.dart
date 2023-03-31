import 'package:flutter/material.dart';
import 'package:flutter_test_agence/modules/account/page/account_login_page.dart';
import 'package:flutter_test_agence/modules/home/page/home_page.dart';
import 'package:flutter_test_agence/modules/product_detail/page/product_detail_page.dart';

class Routes {
  static const String login = "login/";
  static const String home = "/";
  static const String product = "product/";

  Map<String, Widget Function(BuildContext)> getRoutes() {
    final Map<String, Widget Function(BuildContext)> routes = {
      login: (_) => const AccountLoginPage(),
      home: (_) => const HomePage(),
      product: (_) => const ProductDetailPage(),
    };

    return routes;
  }
}
