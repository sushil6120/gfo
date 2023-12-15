import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:gfo/model/seller/uploadProductModel.dart';
import 'package:gfo/utils/app_url.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../model/costumer/allProductModel.dart';

class SellerProductsRepo {
  UploadProductModel? uploadProductModel;
      AllProductModelClass? allProductModelClass;

  Future<UploadProductModel?> uploadProductData(
      String title,
      sku,
      desc,
      requiredPrice,
      salePrice,
      category,
      brand,
      qnty,
      tags,
      city,
      isManagesStock,
      stockStatus,
      stockQnty,
      allowStockOrders,
      lowStockHolder,
      token,
      File thumbnail,
      List<XFile> images) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(AppUrl.sellerUploadProduct),
      );
      request.headers['Content-Type'] = 'application/json';
      request.headers['Authorization'] = 'Bearer $token';

      request.fields['title'] = title;
      request.fields['sku'] = sku;
      request.fields['description'] = desc;
      request.fields['requiredPrice'] = requiredPrice;
      request.fields['salePrice'] = salePrice;
      request.fields['category'] = category;
      request.fields['brand'] = brand;
      request.fields['quantity'] = qnty;
      request.fields['tags'] = tags;
      request.fields['city'] = city;
      request.fields['stockStatus'] = stockStatus;
      request.fields['stockQuantity'] = stockQnty;
      request.fields['allowBackOrders'] = allowStockOrders;
      request.fields['lowStockHolder'] = lowStockHolder;

      request.files
          .add(await http.MultipartFile.fromPath("thumbnail", thumbnail.path));

      for (int i = 0; i < images.length; i++) {
        request.files.add(await http.MultipartFile.fromPath(
          'images',
          images[i].path,
        ));
      }

      var response = await request.send();
      if (response.statusCode == 200) {
        var responseBody = await response.stream.toBytes();
        var data = utf8.decode(responseBody);
        print(data);

        var jsonData = json.decode(data) as Map<String, dynamic>;
        uploadProductModel = UploadProductModel.fromJson(jsonData);
      } else {
        var responseBody = await response.stream.toBytes();
        var data = utf8.decode(responseBody);
        print(data);
        print('Upload failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error uploading data: $e');
    }
    return uploadProductModel;
  }




  Future<AllProductModelClass?> allProductApi(
    int page,
    id
  ) async {
    try {
      final response = await http.get(
          Uri.parse(AppUrl.baseUrl + "/api/v1/product?limit=10&page=$page&sellerId=$id"));
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
