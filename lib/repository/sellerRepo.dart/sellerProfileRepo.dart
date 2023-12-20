import 'dart:convert';

import 'package:gfo/model/seller/sellerProfileModel.dart';
import 'package:http/http.dart' as http;

import '../../utils/app_url.dart';

class SellerProfileRepo {
  SellerProfileModel? sellerProfileModel;

  Future<SellerProfileModel?> sellerprofile(String token) async {
    try {
      final response = await http.get(
        Uri.parse(AppUrl.sellerProfileApi),
        headers: {
          "Content-type": "application/json",
          "Authorization": "Bearer $token"
        },
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        print(data);
        sellerProfileModel = SellerProfileModel.fromJson(data);
      } else {
        print(data);
      }
      return sellerProfileModel;
    } catch (e) {
      print(e);
    }
    return sellerProfileModel;
  }
}
