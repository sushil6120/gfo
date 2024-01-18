import 'package:flutter/material.dart';
import 'package:gfo/model/costumer/getcartModel.dart';
import 'package:gfo/repository/costumerRepo/cart_repo.dart';

import '../response/apiResponse.dart';

class CartViewModel with ChangeNotifier {
  CartRepo cartRepo = CartRepo();

  GetCartModel? getCartModel;

  bool loading = false;
  ApiResponse<dynamic> addressData = ApiResponse.loading();

  setLoading(bool value) {
    loading = value;

    notifyListeners();
  }

  setHomeScreenData(ApiResponse<dynamic> response) {
    addressData = response;
    notifyListeners();
  }

  Future<void> addTocartApi(String id, qty, token, BuildContext context) async {
    setLoading(true);
    try {
      await cartRepo.addToCartApi(id, qty, token, context).then((value) async {
        // Navigator.pushNamedAndRemoveUntil(context, RoutesName.bottomNavigationBarScreen, (route) => false);

        setLoading(false);
      });
    } catch (e) {
      print("exception:" + e.toString());
      setLoading(false);
    }
  }

  Future<void> getCartApi(String token) async {
    setHomeScreenData(ApiResponse.loading());
    try {
      await cartRepo.getCartApi(token).then((value) async {
        getCartModel = value;
        print(getCartModel);
        setHomeScreenData(ApiResponse.completed(getCartModel));
      }).onError((error, stackTrace) {
        setHomeScreenData(ApiResponse.error(error.toString()));
      });
    } catch (e) {
      print("exception:" + e.toString());
    }
  }
}
