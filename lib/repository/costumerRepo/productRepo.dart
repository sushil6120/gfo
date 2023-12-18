import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:gfo/model/costumer/allProductModel.dart';
import 'package:gfo/model/costumer/all_products_model.dart';
import 'package:gfo/model/costumer/anotherProductModel.dart';
import 'package:gfo/model/costumer/productInfoScreen.dart';
import 'package:gfo/utils/app_url.dart';
import 'package:http/http.dart' as http;

class ProductRepo {
  AllProductModelClass? allProductModelClass;
  ProductInfoModel? productInfoModel;

  Future<AllProductModelClass?> allProductApi(
    int page,
  ) async {
    try {
      final response = await http.get(
          Uri.parse(AppUrl.baseUrl + "/api/v1/product?limit=10&page=$page"));
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (kDebugMode) {
          print("this is resposne ${response}");
          print("this is resposne ${response.statusCode}");
        }
        var data = jsonDecode(response.body);
        allProductModelClass = AllProductModelClass.fromJson(data);
        print(data);
        return allProductModelClass;
      } else {
        print(response.body);
      }
    } catch (e) {
      throw (e);
    }
    return allProductModelClass;
  }

  Future<ProductInfoModel?> productInfoApi(String id) async {
    try {
      final response = await http.get(Uri.parse(AppUrl.productInfoApi+id));
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (kDebugMode) {
          print("this is resposne ${response}");
          print("this is resposne ${response.statusCode}");
        }
        var data = jsonDecode(response.body);
        productInfoModel = ProductInfoModel.fromJson(data);
        print(data);
        return productInfoModel;
      } else {
        print(response.body);
      }
    } catch (e) {
      throw (e);
    }
    return productInfoModel;
  }
  Future<AllProductModelClass?> anotherProductApi(String id) async {
    try {
      final response = await http.get(Uri.parse(AppUrl.anotherProductApi+id));
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (kDebugMode) {
          print("this is resposne ${response}");
          print("this is resposne ${response.statusCode}");
        }
        var data = jsonDecode(response.body);
        allProductModelClass = AllProductModelClass.fromJson(data);
        print(data);
        return allProductModelClass;
      } else {
        print(response.body);
      }
    } catch (e) {
      throw (e);
    }
    return allProductModelClass;
  }
}
