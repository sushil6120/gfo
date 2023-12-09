import 'package:flutter/material.dart';
import 'package:gfo/model/login_model_class.dart';
import 'package:gfo/repository/login_repo.dart';
import 'package:gfo/services/sharedPreferencesServices/sharedPreferences.dart';
import 'package:gfo/utils/colors.dart';
import 'package:gfo/utils/routes/routesName.dart';
import 'package:gfo/utils/utilsFunction.dart';

class AuthViewModel with ChangeNotifier {
  LoginRepo loginRepo = LoginRepo();
  LoginModelClass? loginModelClass;

  bool loading = false;

  setLoading(bool value) {
    loading = value;

    notifyListeners();
  }

  Future<void> loginSendApis(String phone, BuildContext context) async {
    setLoading(true);
    try {
      await loginRepo.loginSendOtp(phone, context).then((value) async {
        if (value!.success == true) {
          Navigator.pushNamed(context, RoutesName.loginOtpVerify,arguments: {
            "number":phone
          } );
          Utils.flushBarErrorMessage(value.otp.toString(), context, Icons.error,
              colorLightWhite, backgroundColor);
          setLoading(false);
        } else {
          Utils.flushBarErrorMessage(value.message.toString(), context,
              Icons.error, colorLightWhite, backgroundColor);
          setLoading(false);
        }
      });
    } catch (e) {
      print("exception:" + e.toString());
      setLoading(false);
    }
  }
  Future<void> loginOtpVerifyApis(String phone,otp, BuildContext context) async {
    setLoading(true);
    final SharedPreferencesViewModel sharedPreferencesViewModel = SharedPreferencesViewModel();
    try {
      await loginRepo.loginVerifyOtp(phone, otp, context).then((value) async {
        if (value!.success == true) {
          if(value.userType == "user"){
            sharedPreferencesViewModel.saveToken(value.token);
            Navigator.pushNamed(context, RoutesName.bottomNavigationBarScreen);
          }
          Utils.flushBarErrorMessage(value.message.toString(), context, Icons.error,
              colorLightWhite, greenColor);
          setLoading(false);
        } else {
          Utils.flushBarErrorMessage(value.message.toString(), context,
              Icons.error, colorLightWhite, primaryColor);
          setLoading(false);
        }
      });
    } catch (e) {
      print("exception:" + e.toString());
      setLoading(false);
    }
  }
}
