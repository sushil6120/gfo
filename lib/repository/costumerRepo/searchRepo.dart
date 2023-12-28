import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:gfo/model/costumer/searchModel.dart';
import 'package:gfo/utils/app_url.dart';
import 'package:http/http.dart' as http;

class SearchRepo {
  SearchModel? searchModel;

  Future<SearchModel?> searchApi(
    String query,
  ) async {
    try {
      final response =
          await http.get(Uri.parse(AppUrl.customerSearchApi + query));
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        searchModel = SearchModel.fromJson(data);
        print(data);
        return searchModel;
      } else {
        print(response.body);
      }
    } catch (e) {
      throw (e);
    }
    return searchModel;
  }
}
