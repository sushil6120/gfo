import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gfo/ui/consultant/Consultant_registration.dart';
import 'package:gfo/ui/consultant/consultantBottomNavigation.dart';
import 'package:gfo/ui/consultant/consultant_homeScreen.dart';
import 'package:gfo/ui/consultant/consultant_profile.dart';
import 'package:gfo/ui/consultant/consultant_profile_details.dart';
import 'package:gfo/ui/customer/customer_product_details_screen.dart';
import 'package:gfo/ui/seller/seller_add_inventory_screen.dart';
import 'package:gfo/ui/seller/seller_home_screen.dart';
import 'package:gfo/ui/seller/seller_profile_detail_screen.dart';
import '../../ui/customer/all_products_screen.dart';
import '../../ui/customer/bottom_navBar_Screen.dart';
import '../../ui/customer/checkout_screen.dart';
import '../../ui/customer/customer_add_new_address.dart';
import '../../ui/customer/customer_address_screen.dart';
import '../../ui/customer/customer_home_Screen.dart';
import '../../ui/customer/customer_login_screen.dart';
import '../../ui/customer/login_otp_screen.dart';
import '../../ui/customer/congratulations_screen.dart';
import '../../ui/customer/role_screen.dart';
import '../../ui/seller/seller_add_inventory_general_screen.dart';
import '../../ui/seller/seller_profile_screen.dart';
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
      case RoutesName.bottomNavigationBarScreen:
        return SlideRoute(page: const BottomNavigationBarScreen(), x: 1, y: 0);
      case RoutesName.customerAllProductScreen:
        return SlideRoute(page: const CustomerAllProductScreen(), x: 1, y: 0);
      case RoutesName.customerProductDetailsScreen:
        return SlideRoute(
            page: const CustomerProductDetailsScreen(), x: 1, y: 0);
      case RoutesName.checkOutScreen:
        return SlideRoute(page: const CheckOutScreen(), x: 1, y: 0);
      case RoutesName.customerAddressScreen:
        return SlideRoute(page: const CustomerAddressScreen(), x: 1, y: 0);
      case RoutesName.customerAddNewAddressScreen:
        return SlideRoute(
            page: const CustomerAddNewAddressScreen(), x: 1, y: 0);
      case RoutesName.congrotulationsScreen:
        return SlideRoute(page: const CongrotulationsScreen(), x: 1, y: 0);

      // ------------Selller ------

      case RoutesName.SellerHomeScreen:
        return SlideRoute(page: const SellerHomeScreen(), x: 1, y: 0);
      case RoutesName.SellerProfileScreen:
        return SlideRoute(page: const SellerProfileScreen(), x: 1, y: 0);
      case RoutesName.SellerProfileDetailScreen:
        return SlideRoute(page: const SellerProfileDetailScreen(), x: 1, y: 0);
      case RoutesName.SellerAddInventoryScreen:
        return SlideRoute(page: const SellerAddInventoryScreen(), x: 1, y: 0);
      case RoutesName.SellerAddInventoryGeneralScreen:
        return SlideRoute(
            page: const SellerAddInventoryGeneralScreen(), x: 1, y: 0);

      // --------- consultant ------
      case RoutesName.consultantHomeScreen:
        return SlideRoute(page: const ConsultantHomeScreen(), x: 1, y: 0);
      case RoutesName.consultantBottomNavigationBarScreen:
        return SlideRoute(
            page: const ConsultantBottomNavigationBarScreen(), x: 1, y: 0);
      case RoutesName.consultantProfileScreen:
        return SlideRoute(page: const ConsultantProfileScreen(), x: 1, y: 0);
        case RoutesName.consultantProfileDetailScreen:
        return SlideRoute(page: const ConsultantProfileDetailScreen(), x: 1, y: 0);
        case RoutesName.consultantRegistratinScreen:
        return SlideRoute(page: const ConsultantRegistratinScreen(), x: 1, y: 0);

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
