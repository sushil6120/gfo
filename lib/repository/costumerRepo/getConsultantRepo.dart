import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../model/costumer/getAllConsultantModel.dart';
import '../../model/costumer/single_consultant_model.dart';
import '../../utils/app_url.dart';


class GetConsultantRepo {
  AllConsultantModel? consultantModel;
  SingleConsultantModel? singleConsultantModel;

  Future<AllConsultantModel?> allConsultantApi() async {
    try {
      final response = await http.get(
        Uri.parse(AppUrl.allConsultantApis),
        headers: {"Content-type": "application/json"},
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        print(data);
        consultantModel = AllConsultantModel.fromJson(data);
      } else {
        print(response.body);
      }
      return consultantModel;
    } catch (e) {
      print(e);
    }
  }

  Future<SingleConsultantModel?> singleConsultantApi(String id, token) async {
    try {
      final response = await http.get(
        Uri.parse(AppUrl.singleConsultantApis + id),
        headers: {
          "Content-type": "application/json",
          "Authorization": "Bearer $token"
        },
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        print(data);
        singleConsultantModel = SingleConsultantModel.fromJson(data);
      } else {
        print(response.body);
      }
      return singleConsultantModel;
    } catch (e) {
      print(e);
    }
  }
}
