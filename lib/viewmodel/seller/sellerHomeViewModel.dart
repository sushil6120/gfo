import 'package:flutter/material.dart';
import 'package:gfo/model/seller/sellerProfileModel.dart';
import 'package:gfo/repository/sellerRepo.dart/sellerProfileRepo.dart';

import '../../response/apiResponse.dart';

class SellerHomeViewModel with ChangeNotifier {
  SellerProfileRepo sellerProfileRepo = SellerProfileRepo();

  SellerProfileModel? sellerProfileModel;

  ApiResponse<dynamic> profileData = ApiResponse.loading();

  setHomeScreenData(ApiResponse<dynamic> response) {
    profileData = response;
    notifyListeners();
  }

  Future<void> sellerProfileApi(String token) async {
    setHomeScreenData(ApiResponse.loading());
    try {
      await sellerProfileRepo.sellerprofile(token).then((value) async {
        print(value!.message);
        sellerProfileModel = value;
        print(sellerProfileModel);
        setHomeScreenData(ApiResponse.completed(sellerProfileModel));
        notifyListeners();
      }).onError((error, stackTrace) {
        setHomeScreenData(ApiResponse.error(error.toString()));
      });
    } catch (e) {
      print("exception:" + e.toString());
    }
  }
}
