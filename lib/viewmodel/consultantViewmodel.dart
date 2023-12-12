import 'package:flutter/material.dart';

import '../model/costumer/getAllConsultantModel.dart';
import '../model/costumer/single_consultant_model.dart';
import '../repository/costumerRepo/getConsultantRepo.dart';
import '../response/apiResponse.dart';

class CosultantViewModel with ChangeNotifier {
  GetConsultantRepo getConsultantRepo = GetConsultantRepo();

  AllConsultantModel? allConsultantModel;
  SingleConsultantModel ? singleConsultantModel;

  ApiResponse<dynamic> consultantData = ApiResponse.loading();

  // setConsultantData(ApiResponse<dynamic> response) {
  //   consultantData = response;
  //   notifyListeners();
  // }

  Future<void> getAllConsultantApi() async {
    try {
      await getConsultantRepo.allConsultantApi().then((value) async {
        print(value!.message);
        allConsultantModel = value;
        notifyListeners();
      }).onError((error, stackTrace) {});
    } catch (e) {
      print("exception:" + e.toString());
    }
  }
  Future<void> singleConsultantApis(String id,token) async {
    try {
      await getConsultantRepo.singleConsultantApi(id, token).then((value) async {
        print(value!.message);
        singleConsultantModel = value;
        notifyListeners();
      }).onError((error, stackTrace) {});
    } catch (e) {
      print("exception:" + e.toString());
    }
  }
}
