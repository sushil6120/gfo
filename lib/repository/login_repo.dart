import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gfo/model/login_model_class.dart';
import 'package:gfo/model/otp_verify_model_class.dart';
import 'package:gfo/utils/app_url.dart';
import 'package:gfo/utils/utilsFunction.dart';
import 'package:http/http.dart' as http;

class LoginRepo {
  LoginModelClass? loginModelClass;
  OtpVerifyModelClass? otpVerifyModelClass;

  Future<LoginModelClass?> loginSendOtp(
      String phone, BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse(AppUrl.loginSendApi),
        headers: {"Content-type": "application/json"},
        body: json.encode({"phone": phone}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);

        if (data != null) {
          loginModelClass = LoginModelClass.fromJson(data);
          Utils.toastMessage(loginModelClass!.otp?.toString() ?? "OTP is null");
        } else {
          Utils.toastMessage("Response body is null");
        }
      } else {
        var errorData = jsonDecode(response.body);
        Utils.snackBar(errorData['message'], context);
      }

      return loginModelClass;
    } catch (e) {
      print("Error: $e");
      
      Utils.toastMessage(
          "Failed to connect to the server. Please check your internet connection.");
      return null;
    }
  }

  Future<OtpVerifyModelClass?> loginVerifyOtp(
      String phone, otp, BuildContext context) async {
    try {
      final response = await http.post(
          Uri.parse(AppUrl.loginOtpVerifyApi),
          headers: {"Content-type": "application/json"},
          body: json.encode({"phone": phone, "otp": otp}));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        otpVerifyModelClass = OtpVerifyModelClass.fromJson(data);
      } else {
        Utils.snackBar(data['message'], context);
      }
      return otpVerifyModelClass;
    } catch (e) {
      print(e);
    }
  }
}
