import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gfo/model/costumer/getcartModel.dart';
import 'package:http/http.dart' as http;

import '../../utils/app_url.dart';
import '../../utils/utilsFunction.dart';

class CartRepo {
  GetCartModel? getCartModel;

  Future<void> addToCartApi(String id, qty, token, BuildContext context) async {
    try {
      final response = await http.post(Uri.parse(AppUrl.addToCartApi),
          headers: {
            "Content-type": "application/json",
            "Authorization": "Bearer $token"
          },
          body: json.encode({"productId": id, "quantity": qty}));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        Utils.snackBar(data['message'], context);
      } else {
        Utils.snackBar(data['message'], context);
        print(response..body);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<GetCartModel?> getCartApi(String token) async {
    try {
      final response = await http.get(
        Uri.parse(AppUrl.getCart),
        headers: {
          "Content-type": "application/json",
          "Authorization": "Bearer $token"
        },
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        print(data);
        getCartModel = GetCartModel.fromJson(data);
      } else {
        print(response.body);
      }
      return getCartModel;
    } catch (e) {
      print(e);
    }
  }
}
