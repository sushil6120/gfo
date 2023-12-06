import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hisab_brabar/services/sharedPreferencesServices/sharedPreferences.dart';

import '../../utils/routes/routesName.dart';

class LoginStatusService {
  Future<String?> getTokenValue() {
    return SharedPreferencesViewModel().getToken();
  }

  Future<String?> getSignUpTokenValue() {
    return SharedPreferencesViewModel().getSignUpToken();
  }

  Future<bool?> getIsInstalledValue() {
    return SharedPreferencesViewModel().getIsInstalled();
  }

  void checkAuthention(BuildContext context) async {
    getTokenValue().then((value) async {
      if (value == "null" || value == "" || value == null) {
        // Timer(
        //     const Duration(seconds: 3),
        //     () => Navigator.pushNamedAndRemoveUntil(
        //         context, RoutesName.loginScreen, (route) => false));
      } else {
        // Timer(
        //     const Duration(seconds: 3),
        //     () => Navigator.pushNamedAndRemoveUntil(context,
        //         RoutesName.bottomNavigationBarScreen, (route) => false));
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  void checkIsInstalled(BuildContext context) async {
    getIsInstalledValue().then((value) async {
      print("this is value $value");
      if (value == true) {
        checkAuthention(context);
      } else {
        // Timer(
        //     const Duration(seconds: 3),
        //     () => Navigator.pushNamedAndRemoveUntil(
        //         context, RoutesName.onboardingScreen, (route) => false));
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
