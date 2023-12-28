import 'package:flutter/material.dart';
import 'package:gfo/model/costumer/allProductModel.dart';
import 'package:gfo/model/costumer/productInfoScreen.dart';
import 'package:gfo/repository/costumerRepo/productRepo.dart';

import '../response/apiResponse.dart';

class HomeViewModel with ChangeNotifier {
  ProductRepo productRepo = ProductRepo();

  AllProductModelClass? allProductModelClass;
  ProductInfoModel? productInfoModel;

  List<Products> products = [];
  int currentPage = 1;

  ApiResponse<dynamic> allProductData = ApiResponse.loading();

  setHomeScreenData(ApiResponse<dynamic> response) {
    allProductData = response;
    notifyListeners();
  }

  Future<void> getAllProduct() async {
    setHomeScreenData(ApiResponse.loading());
    try {
      currentPage = 1;
      await productRepo.allProductApi(currentPage).then((value) async {
        allProductModelClass = value;
        print(allProductModelClass);
        products.addAll(allProductModelClass!.products!.toList());
        currentPage++;
        print(
            "assets" + allProductModelClass!.products![0].salePrice.toString());
        setHomeScreenData(ApiResponse.completed(products));
      }).onError((error, stackTrace) {
        setHomeScreenData(ApiResponse.error(error.toString()));
      });
    } catch (e) {
      print("exception:" + e.toString());
    }
  }

  Future<void> getProductInfoApi(String id) async {
    setHomeScreenData(ApiResponse.loading());
    try {
      await productRepo.productInfoApi(id).then((value) async {
        productInfoModel = value;
        print(productInfoModel);
        setHomeScreenData(ApiResponse.completed(productInfoModel));
      }).onError((error, stackTrace) {
        setHomeScreenData(ApiResponse.error(error.toString()));
      });
    } catch (e) {
      print("exception:" + e.toString());
    }
  }
  Future<void> getAnotherProductApi(String id) async {
    setHomeScreenData(ApiResponse.loading());
    try {
      await productRepo.anotherProductApi(id).then((value) async {
        allProductModelClass = value;
        print(allProductModelClass);
        setHomeScreenData(ApiResponse.completed(allProductModelClass));
      }).onError((error, stackTrace) {
        setHomeScreenData(ApiResponse.error(error.toString()));
      });
    } catch (e) {
      print("exception:" + e.toString());
    }
  }
}
