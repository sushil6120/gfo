import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gfo/model/costumer/addAddressModel.dart';
import 'package:gfo/model/costumer/defualtAddressModel.dart' as defaultAddress;
import 'package:gfo/model/costumer/deleteAddressModel.dart' as deleteModel;
import 'package:http/http.dart' as http;

import '../../model/costumer/applyNocModel.dart';
import '../../model/costumer/getAddressModel.dart';
import '../../utils/app_url.dart';
import '../../utils/utilsFunction.dart';

class AddressRepo {
  AddAddressModel? addAddressModel;
  Address? address;
  deleteModel.DeleteAddressApi? deleteAddressApi;
  defaultAddress.DefaultAddressModel? defaultAddressModel;

    Future<AddAddressModel?> addAddressApi(String pincode, address, locality,
        city, state, token, BuildContext context) async {
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

  Future<deleteModel.DeleteAddressApi?> deletAddress(
      String id, token, BuildContext context) async {
    try {
      final response = await http.delete(
        Uri.parse(AppUrl.deletAddressApi + id),
        headers: {
          "Content-type": "application/json",
          "Authorization": "Bearer $token"
        },
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        deleteAddressApi = deleteModel.DeleteAddressApi.fromJson(data);
      } else {
        Utils.snackBar(data['message'], context);
        print(response..body);
      }
      return deleteAddressApi;
    } catch (e) {
      print(e);
    }
    return deleteAddressApi;
  }

  Future<defaultAddress.DefaultAddressModel?> defualtAdrresApi(
      String id, token, BuildContext context) async {
    try {
      final response = await http.patch(
        Uri.parse(AppUrl.defualtAddressApi + id),
        headers: {
          "Content-type": "application/json",
          "Authorization": "Bearer $token"
        },
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        print(data);
        defaultAddressModel = defaultAddress.DefaultAddressModel.fromJson(data);
      } else {
        Utils.snackBar(data['message'], context);
        print(response..body);
      }
      return defaultAddressModel;
    } catch (e) {
      print(e);
    }
    return defaultAddressModel;
  }

  Future<deleteModel.DeleteAddressApi?> updateAddress(String pinCode, addresss,
      localty, city, state, id, token, BuildContext context) async {
    try {
      final response = await http.put(
        Uri.parse(AppUrl.updateAddressApi + id),
        body: jsonEncode({
          "pinCode": pinCode,
          "address": addresss,
          "locality": localty,
          "city": city,
          "state": state
        }),
        headers: {
          "Content-type": "application/json",
          "Authorization": "Bearer $token"
        },
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        deleteAddressApi = deleteModel.DeleteAddressApi.fromJson(data);
      } else {
        Utils.snackBar(data['message'], context);
        print(response..body);
      }
      return deleteAddressApi;
    } catch (e) {
      print(e);
    }
    return deleteAddressApi;
  }

  Future<Address?> addressApi(String token) async {
    try {
      final response = await http.get(
        Uri.parse(AppUrl.allAddressApi),
        headers: {
          "Content-type": "application/json",
          "Authorization": "Bearer $token"
        },
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        print(data);
        address = Address.fromJson(data);
      } else {
        print(response.body);
      }
      return address;
    } catch (e) {
      print(e);
    }
  }
}
