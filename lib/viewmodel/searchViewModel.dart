import 'package:flutter/material.dart';
import 'package:gfo/model/costumer/searchModel.dart';
import 'package:gfo/repository/costumerRepo/searchRepo.dart';

import '../response/apiResponse.dart';

class SearchViewModel with ChangeNotifier {
  SearchRepo searchRepo = SearchRepo();

  SearchModel? searchModel;

  List<Products> searchProduct = [];
  List<Products> suggestions = [];

  ApiResponse<dynamic> allProductData = ApiResponse.loading();

  setHomeScreenData(ApiResponse<dynamic> response) {
    allProductData = response;
    notifyListeners();
  }

  Future<void> getSearchProduct(String query) async {
    setHomeScreenData(ApiResponse.loading());
    try {
      await searchRepo.searchApi(query).then((value) async {
        searchModel = value;
        print(searchModel);
        searchProduct.addAll(searchModel!.products!.toList());
        notifyListeners();

        setHomeScreenData(ApiResponse.completed(searchProduct));
      }).onError((error, stackTrace) {
        setHomeScreenData(ApiResponse.error(error.toString()));
      });
    } catch (e) {
      print("exception:" + e.toString());
    }
  }

  void getSearchSuggestions(String query) {
    if (query.isEmpty || query == null) {
      suggestions = [];
      notifyListeners();
    } else {
      suggestions = generateSuggestions(query);
      notifyListeners();
    }
  }

  List<Products> generateSuggestions(String query) {
    getSearchProduct(query);
    return searchProduct
        .where((suggestion) =>
            suggestion.title!.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
