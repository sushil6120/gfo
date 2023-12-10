import 'package:flutter/material.dart';
import 'package:gfo/model/login_model_class.dart';
import 'package:gfo/repository/login_repo.dart';
import 'package:gfo/repository/singUpRepo.dart';
import 'package:gfo/services/sharedPreferencesServices/sharedPreferences.dart';
import 'package:gfo/utils/colors.dart';
import 'package:gfo/utils/routes/routesName.dart';
import 'package:gfo/utils/utilsFunction.dart';

class AuthViewModel with ChangeNotifier {
  LoginRepo loginRepo = LoginRepo();
  SignUpRepo signUpRepo = SignUpRepo();

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
          Navigator.pushNamed(context, RoutesName.loginOtpVerify,
              arguments: {"number": phone});
          Utils.flushBarErrorMessage(value.otp.toString(), context, Icons.error,
              colorLightWhite, Colors.green.shade400);
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

  Future<void> loginOtpVerifyApis(
      String phone, otp, BuildContext context) async {
    setLoading(true);
    final SharedPreferencesViewModel sharedPreferencesViewModel =
        SharedPreferencesViewModel();
    try {
      await loginRepo.loginVerifyOtp(phone, otp, context).then((value) async {
        if (value!.success == true) {
          if (value.userType == "user") {
            sharedPreferencesViewModel.saveToken(value.token);
            Navigator.pushNamed(context, RoutesName.bottomNavigationBarScreen);
          } else if (value.userType == "consultant") {
            sharedPreferencesViewModel.saveConsultantToken(value.token);
            Navigator.pushNamed(
                context, RoutesName.consultantBottomNavigationBarScreen);
          } else if (value.userType == "seller") {
            sharedPreferencesViewModel.saveSellerToken(value.token);
            Navigator.pushNamed(context, RoutesName.SellerBottomNavBar);
          } else {
            Utils.flushBarErrorMessage("Somthing Went Weong", context,
                Icons.error, colorLightWhite, primaryColor);
            setLoading(false);
          }
          Utils.flushBarErrorMessage(value.message.toString(), context,
              Icons.error, colorLightWhite, greenColor);
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

  // ------- consultantSignUp-------

  Future<void> consultantSignUpApi(String phone, BuildContext context) async {
    setLoading(true);
    try {
      await signUpRepo.consultantSignUp(phone, context).then((value) async {
        if (value!.message == "Consultant created successfully") {
          Navigator.pushNamed(context, RoutesName.SignUpOtpScreen,
              arguments: {"number": phone});
          Utils.flushBarErrorMessage(value.user!.otp.toString(), context,
              Icons.error, colorLightWhite, Colors.green.shade400);
        }
        setLoading(false);
      });
    } catch (e) {
      print("exception:" + e.toString());
      setLoading(false);
    }
  }

  Future<void> costumerSignUpApis(String phone, BuildContext context) async {
    setLoading(true);
    try {
      await signUpRepo.costumerSignUpScreen(phone, context).then((value) async {
        if (value!.message == "Customer created successfully") {
          Navigator.pushNamed(context, RoutesName.SignUpOtpScreen,
              arguments: {"number": phone});
          Utils.flushBarErrorMessage(value.user!.otp.toString(), context,
              Icons.error, colorLightWhite, Colors.green.shade400);
        }
        setLoading(false);
      });
    } catch (e) {
      print("exception:" + e.toString());
      setLoading(false);
    }
  }

  Future<void> sellerSignUpApis(String phone, BuildContext context) async {
    setLoading(true);
    try {
      await signUpRepo.sellerSignUp(phone, context).then((value) async {
        if (value!.message == "Seller created successfully") {
          Navigator.pushNamed(context, RoutesName.SignUpOtpScreen,
              arguments: {"number": phone});
          Utils.flushBarErrorMessage(value.user!.otp.toString(), context,
              Icons.error, colorLightWhite, Colors.green.shade400);
        }
        setLoading(false);
      });
    } catch (e) {
      print("exception:" + e.toString());
      setLoading(false);
    }
  }

  // -----------  signUpOtp Verify -----

  Future<void> signUpOtpVerifyApis(
      String phone, otp, BuildContext context) async {
    setLoading(true);
    final SharedPreferencesViewModel sharedPreferencesViewModel =
        SharedPreferencesViewModel();
    try {
      await signUpRepo.signUpOtpVerify(phone, otp, context).then((value) async {
        if (value!.success == true) {
          if (value.userType == "user") {
            sharedPreferencesViewModel.saveSignUpToken(value.token);
            // Navigator.pushNamed(context, RoutesName.bottomNavigationBarScreen);
          } else if (value.userType == "consultant") {
            sharedPreferencesViewModel.saveConsultantSignUpToken(value.token);
            // Navigator.pushNamed(
            //     context, RoutesName.consultantBottomNavigationBarScreen);
          } else if (value.userType == "seller") {
            sharedPreferencesViewModel.saveSellerSignUpToken(value.token);
            // Navigator.pushNamed(context, RoutesName.SellerBottomNavBar);
          } else {
            Utils.flushBarErrorMessage("Somthing Went Weong", context,
                Icons.error, colorLightWhite, primaryColor);
            setLoading(false);
          }
          Utils.flushBarErrorMessage(value.message.toString(), context,
              Icons.error, colorLightWhite, greenColor);
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
