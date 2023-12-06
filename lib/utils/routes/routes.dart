import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../ui/customer/customer_home_Screen.dart';
import '../../ui/customer/customer_login_screen.dart';
import '../../ui/customer/login_otp_screen.dart';
import '../../ui/customer/role_screen.dart';
import '../slideTransition.dart';
import 'routesName.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case RoutesName.splashScreen:
      //   return SlideRoute(page: const SplashScreen(), x: 1, y: 0);
      case RoutesName.splashScreen:
        return SlideRoute(page: const CustomerLoginScreen(), x: 1, y: 0);
      case RoutesName.loginOtpVerify:
        return SlideRoute(page: const LoginOtpVerifyScreen(), x: 1, y: 0);
      case RoutesName.rolesScreen:
        return SlideRoute(page: const RolesScreen(), x: 1, y: 0);
      case RoutesName.customerHomeScreen:
        return SlideRoute(page: const CustomerHomeScreen(), x: 1, y: 0);

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('NO route defined'),
            ),
          );
        });
    }
  }
}
