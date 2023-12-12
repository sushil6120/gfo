import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gfo/model/costumer/applyNocModel.dart';
import 'package:gfo/utils/app_url.dart';
import 'package:http/http.dart' as http;

import '../../utils/utilsFunction.dart';

class NocRepo {
  ApplyNocModel? applyNocModel;

  Future<ApplyNocModel?> applyNocAPi(String name, place, contact, address, date,
      pincode, selectOption, token, BuildContext context) async {
    try {
      final response = await http.post(Uri.parse(AppUrl.applyNocApis),
          headers: {"Content-type": "application/json", "Authorization": "Bearer $token"},
          body: json.encode({
            "nocName": name,
            "nocPlace": place,
            "nocContact": contact,
            "nocAddress": address,
            "nocDateAndTime": date,
            "nocPinCode": pincode,
            "nocSelectOption": selectOption
          }));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        applyNocModel = ApplyNocModel.fromJson(data);
      } else {
        Utils.snackBar(data['message'], context);
        print(response..body);
      }
      return applyNocModel;
    } catch (e) {
      print(e);
    }
    return applyNocModel;
  }
}
