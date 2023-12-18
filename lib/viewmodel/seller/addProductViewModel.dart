import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gfo/model/seller/uploadProductModel.dart';
import 'package:gfo/repository/costumerRepo/productRepo.dart';
import 'package:gfo/repository/sellerRepo.dart/sellerProductsRepo.dart';
import 'package:gfo/utils/routes/routesName.dart';
import 'package:image_picker/image_picker.dart';

import '../../model/costumer/allProductModel.dart';
import '../../model/costumer/productInfoScreen.dart';
import '../../response/apiResponse.dart';
import '../../utils/colors.dart';
import '../../utils/utilsFunction.dart';

class AddProductViewModel with ChangeNotifier {
  SellerProductsRepo sellerProductsRepo = SellerProductsRepo();
  ProductRepo productRepo = ProductRepo();
  AllProductModelClass? allProductModelClass;
  UploadProductModel? uploadProductModel;
  ProductInfoModel? productInfoModel;

  List<XFile>? imageList = [];
  bool loading = false;
  List<Products> products = [];
  int currentPage = 1;
  File? selectedImage;

  setLoading(bool value) {
    loading = value;

    notifyListeners();
  }

  removeImage(int index) {
    imageList!.removeAt(index);
    notifyListeners();
  }

  Future<void> pickSingleImage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );

      if (pickedFile != null) {
        selectedImage = File(pickedFile.path);
        notifyListeners();
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  Future<void> pickImages() async {
    try {
      final pickedFiles = await ImagePicker().pickMultiImage(
        imageQuality: 80,
        maxWidth: 800,
        maxHeight: 800,
      );

      if (pickedFiles != null) {
        imageList!.addAll(pickedFiles);
        notifyListeners();
      }
    } catch (e) {
      print("Error picking images: $e");
    }
  }

  Future<void> uplaodProductApi(
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
      // File thumbnail,
      // List<XFile> images,
      String token,
      BuildContext context) async {
    setLoading(true);
    try {
      await sellerProductsRepo
          .uploadProductData(
              title,
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
              selectedImage!,
              imageList!)
          .then((value) async {
        // Navigator.pushNamedAndRemoveUntil(context, RoutesName.bottomNavigationBarScreen, (route) => false);
        if (value!.success == true) {
          Navigator.pushNamedAndRemoveUntil(
              context, RoutesName.SellerBottomNavBar, (route) => false);
          Utils.flushBarErrorMessage(value.message.toString(), context,
              Icons.error, colorLightWhite, greenColor);
        }

        setLoading(false);
      });
    } catch (e) {
      print("exception:" + e.toString());
      setLoading(false);
    }
  }

  ApiResponse<dynamic> allProductData = ApiResponse.loading();

  setHomeScreenData(ApiResponse<dynamic> response) {
    allProductData = response;
    notifyListeners();
  }

  Future<void> getAllProduct(String id) async {
    currentPage = 1;

    setHomeScreenData(ApiResponse.loading());
    try {
      await sellerProductsRepo
          .allProductApi(currentPage, id)
          .then((value) async {
        allProductModelClass = value;
        print(allProductModelClass);
        products.clear(); // Clear existing products before adding new ones
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

  Future<void> deleteProduct(String id, token, BuildContext context) async {
    setLoading(true);
    try {
      await sellerProductsRepo
          .deleteProductApi(id, token, context)
          .then((value) async {
        setLoading(false);
      }).onError((error, stackTrace) {
        print(error.toString());
        setLoading(false);
      });
    } catch (e) {
      print("exception:" + e.toString());
      setLoading(false);
    }
  }
}
