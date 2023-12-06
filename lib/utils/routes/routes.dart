import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hisab_brabar/utils/routes/routesName.dart';
import '../../ui/add_entry_with_rates.dart';
import '../../ui/attendence_screen.dart';
import '../../ui/basic_info_screen.dart';
import '../../ui/category_screen.dart';
import '../../ui/donations_screen.dart';
import '../../ui/electricity_charges_screen.dart';
import '../../ui/equipment_purchased_screen.dart';
import '../../ui/home_screen.dart';
import '../../ui/login_otp_verify.dart';
import '../../ui/login_screen.dart';
import '../../ui/menu_screen.dart';
import '../../ui/purchase_screen.dart';
import '../../ui/qr_code_screen.dart';
import '../../ui/rate_and_expanses.dart';
import '../../ui/rate_list_screen.dart';
import '../../ui/rent_screen.dart';
import '../../ui/sales_screen.dart';
import '../../ui/select_language_screen.dart';
import '../../ui/sign_up_screen.dart';
import '../../ui/sign_up_verifying_otp.dart';
import '../../ui/splash_screen.dart';
import '../../ui/summary_screen.dart';
import '../../ui/water_expanse_screen.dart';
import '../slideTransition.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return SlideRoute(page: const SplashScreen(), x: 1, y: 0);
      case RoutesName.loginScreen:
        return SlideRoute(page: const LoginScreen(), x: 1, y: 0);
      case RoutesName.loginOtpVerify:
        return SlideRoute(page: const LoginOtpVerify(), x: 1, y: 0);
      case RoutesName.signUpScreen:
        return SlideRoute(page: const SignUpScreen(), x: 1, y: 0);
      case RoutesName.singUpVerifyOtp:
        return SlideRoute(page: const SingUpVerifyOtp(), x: 1, y: 0);
      case RoutesName.selectLanguageScreen:
        return SlideRoute(page: const SelectLanguageScreen(), x: 1, y: 0);
      case RoutesName.basicInfoScreen:
        return SlideRoute(page: const BasicInfoScreen(), x: 1, y: 0);
      case RoutesName.homeScreen:
        return SlideRoute(page: const HomeScreen(), x: 1, y: 0);
      case RoutesName.purchaseScreen:
        return SlideRoute(page: const PurchaseScreen(), x: 1, y: 0);
      case RoutesName.rateListScreen:
        return SlideRoute(page: const RateListScreen(), x: 1, y: 0);
      case RoutesName.categoryScreen:
        return SlideRoute(page: const CategoryScreen(), x: 1, y: 0);
      case RoutesName.addEntryWithRates:
        return SlideRoute(page: const AddEntryWithRates(), x: 1, y: 0);
      case RoutesName.qrCodeScreen:
        return SlideRoute(page: const QrCodeScreen(), x: 1, y: 0);
      case RoutesName.menuScreen:
        return SlideRoute(page: const MenuScreen(), x: 1, y: 0);
      case RoutesName.rateAndExpanses:
        return SlideRoute(page: const RateAndExpanses(), x: 1, y: 0);
      case RoutesName.summaryScreen:
        return SlideRoute(page: const SummaryScreen(), x: 1, y: 0);
      case RoutesName.rentScreen:
        return SlideRoute(page: const RentScreen(), x: 1, y: 0);
      case RoutesName.equipementPurchasedScreen:
        return SlideRoute(page: const EquipementPurchasedScreen(), x: 1, y: 0);
      case RoutesName.waterExpansesScreen:
        return SlideRoute(page: const WaterExpansesScreen(), x: 1, y: 0);
      case RoutesName.electricityChargesScreen:
        return SlideRoute(page: const ElectricityChargesScreen(), x: 1, y: 0);
      case RoutesName.donationsScreen:
        return SlideRoute(page: const DonationsScreen(), x: 1, y: 0);
      case RoutesName.salesScreen:
        return SlideRoute(page: const SalesScreen(), x: 1, y: 0);
      case RoutesName.attendanceScreen:
        return SlideRoute(page: const AttendanceScreen(), x: 1, y: 0);

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
