import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gfo/model/login_model_class.dart';
import 'package:gfo/model/otp_verify_model_class.dart';
import 'package:gfo/utils/utilsFunction.dart';
import 'package:http/http.dart' as http;

class LoginRepo {
  LoginModelClass? loginModelClass;
  OtpVerifyModelClass?otpVerifyModelClass;

  Future<LoginModelClass?> loginSendOtp(
      String phone, BuildContext context) async {
    try {
      final response = await http.post(
          Uri.parse("https://gfo-fire.vercel.app/api/v1/auth/user/login"),
          headers: {"Content-type": "application/json"},
          body: json.encode({"phone": phone}));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        loginModelClass = LoginModelClass.fromJson(data);
        Utils.toastMessage(loginModelClass!.otp.toString());
      } else {
        Utils.snackBar(data['message'], context);
      }
      return loginModelClass;
    } catch (e) {}
  }
  Future<OtpVerifyModelClass?> loginVerifyOtp(
      String phone,otp, BuildContext context) async {
    try {
      final response = await http.post(
          Uri.parse("https://gfo-fire.vercel.app/api/v1/auth/otp/verify"),
          headers: {"Content-type": "application/json"},
          body: json.encode({"phone": phone, "otp":otp}));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        otpVerifyModelClass = OtpVerifyModelClass.fromJson(data);
      } else {
        Utils.snackBar(data['message'], context);
      }
      return otpVerifyModelClass;
    } catch (e) {}
  }
}
