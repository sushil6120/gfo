// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:gfo/model/all_products_model.dart';
// import 'package:http/http.dart' as http;

// import '../utils/app_url.dart';

// class HomeRepository {
//   AllProductModel? allProductModel;

//   Future<AllProductModel?> allProductApi(
//       String phone, BuildContext context) async {
//     try {
//       final response = await http.get(
//         Uri.parse(AppUrl.allProductApi),
//         headers: {"Content-type": "application/json"},
//       );
//       var data = jsonDecode(response.body);
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         var data = jsonDecode(response.body);
//         print(data);
//         allProductModel = AllProductModel.fromJson(data);
//       } else {
//         Utils.snackBar(data['message'], context);
//       }
//       return consultantSignUpModel;
//     } catch (e) {
//       print(e);
//     }
//   }
// }
