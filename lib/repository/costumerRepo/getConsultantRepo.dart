import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gfo/model/costumer/createBookingModel.dart';
import 'package:http/http.dart' as http;

import '../../model/costumer/getAllConsultantModel.dart';
import '../../model/costumer/single_consultant_model.dart';
import '../../utils/app_url.dart';
import '../../utils/utilsFunction.dart';

class GetConsultantRepo {
  AllConsultantModel? consultantModel;
  SingleConsultantModel? singleConsultantModel;
  CreateBookingModel? createBookingModel;

  Future<AllConsultantModel?> allConsultantApi() async {
    try {
      final response = await http.get(
        Uri.parse(AppUrl.allConsultantApis),
        headers: {"Content-type": "application/json"},
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        print(data);
        consultantModel = AllConsultantModel.fromJson(data);
      } else {
        print(response.body);
      }
      return consultantModel;
    } catch (e) {
      print(e);
    }
  }

  Future<SingleConsultantModel?> singleConsultantApi(String id, token) async {
    try {
      final response = await http.get(
        Uri.parse(AppUrl.singleConsultantApis + id),
        headers: {
          "Content-type": "application/json",
          "Authorization": "Bearer $token"
        },
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        print(data);
        singleConsultantModel = SingleConsultantModel.fromJson(data);
      } else {
        print(response.body);
      }
      return singleConsultantModel;
    } catch (e) {
      print(e);
    }
  }

  // -------- consultantBooking ------

  Future<CreateBookingModel?> createBooking(String userId, consultedId,
      bokingDate, fee, token, BuildContext context) async {
    try {
      final response = await http.post(
          Uri.parse(AppUrl.createConsultantBooking),
          headers: {
            "Content-type": "application/json",
            "Authorization": "Bearer $token"
          },
          body: json.encode({
            "userId": userId,
            "consultantId": consultedId,
            "bookingDate": bokingDate,
            "paymentAmount": fee
          }));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        createBookingModel = CreateBookingModel.fromJson(data);
      } else {
        Utils.snackBar(data['message'], context);
        print(response..body);
      }
      return createBookingModel;
    } catch (e) {
      print(e);
    }
    return createBookingModel;
  }
}
