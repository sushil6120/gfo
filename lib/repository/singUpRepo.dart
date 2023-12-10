import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gfo/model/consultantSignUpModel.dart';
import 'package:gfo/model/login_model_class.dart';
import 'package:gfo/model/otp_verify_model_class.dart';
import 'package:gfo/utils/app_url.dart';
import 'package:gfo/utils/colors.dart';
import 'package:gfo/utils/routes/routesName.dart';
import 'package:gfo/utils/utilsFunction.dart';
import 'package:gfo/verification/consultant_sign_up.dart';
import 'package:http/http.dart' as http;

class SignUpRepo {
  LoginModelClass? loginModelClass;
  OtpVerifyModelClass? otpVerifyModelClass;
  ConsultantSignUpModel? consultantSignUpModel;

  Future<ConsultantSignUpModel?> consultantSignUp(
      String phone, BuildContext context) async {
    try {
      final response = await http.post(Uri.parse(AppUrl.consultantSignUpApi),
          headers: {"Content-type": "application/json"},
          body: json.encode({"phone": phone}));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        print(data);
        consultantSignUpModel = ConsultantSignUpModel.fromJson(data);

       
      } else {
        Utils.snackBar(data['message'], context);
      }
      return consultantSignUpModel;
    } catch (e) {
      print(e);
    }
  }

  Future<ConsultantSignUpModel?> costumerSignUpScreen(
      String phone, BuildContext context) async {
    try {
      final response = await http.post(Uri.parse(AppUrl.costumerSignUpApi),
          headers: {"Content-type": "application/json"},
          body: json.encode({"phone": phone}));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        print(data);
        consultantSignUpModel = ConsultantSignUpModel.fromJson(data);
      } else {
        Utils.snackBar(data['message'], context);
        print(response.body);
      }
      return consultantSignUpModel;
    } catch (e) {
      print(e);
    }
  }

  Future<ConsultantSignUpModel?> sellerSignUp(
      String phone, BuildContext context) async {
    try {
      final response = await http.post(Uri.parse(AppUrl.sellerSignUpApi),
          headers: {"Content-type": "application/json"},
          body: json.encode({"phone": phone}));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        print(data);
        consultantSignUpModel = ConsultantSignUpModel.fromJson(data);

    
      } else {
        Utils.snackBar(data['message'], context);
      }
      return consultantSignUpModel;
    } catch (e) {
      print(e);
    }
  }

  Future<OtpVerifyModelClass?> signUpOtpVerify(
      String phone, otp, BuildContext context) async {
    try {
      final response = await http.post(Uri.parse(AppUrl.loginOtpVerifyApi),
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
