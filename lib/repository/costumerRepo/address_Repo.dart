import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gfo/model/costumer/addAddressModel.dart';
import 'package:http/http.dart' as http;

import '../../model/costumer/applyNocModel.dart';
import '../../utils/app_url.dart';
import '../../utils/utilsFunction.dart';

class AddressRepo {
  AddAddressModel? addAddressModel;

  Future<AddAddressModel?> addAddressApi(String pincode, address, locality, city,
      state,token, BuildContext context) async {
    try {
      final response = await http.post(Uri.parse(AppUrl.addAddressApi),
          headers: {
            "Content-type": "application/json",
            "Authorization": "Bearer $token"
          },
          body: json.encode({
            "pinCode": pincode,
            "address": address,
            "locality": locality,
            "city": city,
            "state": state
          }));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        addAddressModel = AddAddressModel.fromJson(data);
      } else {
        Utils.snackBar(data['message'], context);
        print(response..body);
      }
      return addAddressModel;
    } catch (e) {
      print(e);
    }
    return addAddressModel;
  }
}
