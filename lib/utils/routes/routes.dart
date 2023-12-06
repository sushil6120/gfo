import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../ui/customer/customer_login_screen.dart';
import '../slideTransition.dart';
import 'routesName.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case RoutesName.splashScreen:
      //   return SlideRoute(page: const SplashScreen(), x: 1, y: 0);
      case RoutesName.splashScreen:
        return SlideRoute(page: const CustomerLoginScreen(), x: 1, y: 0);

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
