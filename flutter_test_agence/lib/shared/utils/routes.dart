import 'package:flutter/material.dart';
import 'package:flutter_test_agence/modules/account/page/account_login_page.dart';
import 'package:flutter_test_agence/modules/home/page/home_page.dart';

class Routes {
  static const String login = "login/";
  static const String home = "/";

  Map<String, Widget Function(BuildContext)> getRoutes() {
    final Map<String, Widget Function(BuildContext)> routes = {
      login: (_) => const AccountLoginPage(),
      home: (_) => const HomePage(),
    };

    return routes;
  }
}
