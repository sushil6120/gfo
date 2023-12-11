import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gfo/services/sharedPreferencesServices/sharedPreferences.dart';
import 'package:gfo/utils/routes/routesName.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreferencesViewModel _sharedPreferencesViewModel =
      SharedPreferencesViewModel();

  String? customerLoginToken;
  String? consultantLoginToken;
  String? sellerLoginToken;

  bool isCustomer = false;
  bool isCosultant = false;
  bool isSeller = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.wait([
      _sharedPreferencesViewModel.getToken(),
      _sharedPreferencesViewModel.getConsultantToken(),
      _sharedPreferencesViewModel.getSellerToken()
    ]).then((value) {
      customerLoginToken = value[0];
      consultantLoginToken = value[1];
      sellerLoginToken = value[2];

      if (customerLoginToken != null) {
        isCustomer = true;
      } else if (consultantLoginToken != null) {
        isCosultant = true;
      } else if (sellerLoginToken != null) {
        isSeller = true;
      } else {
        isCustomer = false;
        isCosultant = false;
        isSeller = false;
      }
    });

    Timer(Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context,
          isCustomer == true
              ? RoutesName.bottomNavigationBarScreen
              : isCosultant == true
                  ? RoutesName.consultantBottomNavigationBarScreen
                  : isSeller == true
                      ? RoutesName.SellerBottomNavBar
                      : RoutesName.splashScreen,
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "GFO",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          )
        ],
      ),
    );
  }
}
