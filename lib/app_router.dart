import 'package:flutter/material.dart';

import 'Features/auth/presentaion/view/login_screen.dart';


class AppRouter {
  AppRouter._();

  static final navigatorKey = GlobalKey<NavigatorState>();

  static final routes = {

    LoginScreen.routeName: (_) =>  LoginScreen(),

  };
}
