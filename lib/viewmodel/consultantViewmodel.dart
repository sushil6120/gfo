import 'package:flutter/material.dart';
import 'package:gfo/utils/colors.dart';

import '../model/costumer/getAllConsultantModel.dart';
import '../model/costumer/single_consultant_model.dart';
import '../repository/costumerRepo/getConsultantRepo.dart';
import '../response/apiResponse.dart';
import '../utils/routes/routesName.dart';
import '../utils/utilsFunction.dart';

class CosultantViewModel with ChangeNotifier {
  GetConsultantRepo getConsultantRepo = GetConsultantRepo();

  AllConsultantModel? allConsultantModel;
  SingleConsultantModel? singleConsultantModel;

  ApiResponse<dynamic> consultantData = ApiResponse.loading();
  bool loading = false;

  setLoading(bool value) {
    loading = value;

    notifyListeners();
  }

  // setConsultantData(ApiResponse<dynamic> response) {
  //   consultantData = response;
  //   notifyListeners();
  // }

  setHomeScreenData(ApiResponse<dynamic> response) {
    consultantData = response;
    notifyListeners();
  }

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

  Future<void> singleConsultantApis(String id, token) async {
    setHomeScreenData(ApiResponse.loading());
    try {
      await getConsultantRepo
          .singleConsultantApi(id, token)
          .then((value) async {
        print(value!.data);
        singleConsultantModel = value;
        setHomeScreenData(ApiResponse.completed(singleConsultantModel));
        notifyListeners();
      }).onError((error, stackTrace) {
        setHomeScreenData(ApiResponse.error(error.toString()));
      });
    } catch (e) {
      print("exception:" + e.toString());
    }
  }

  Future<void> createBookingApi(String userId, consultedId, bokingDate, fee,
      token, BuildContext context) async {
    setLoading(true);
    try {
      await getConsultantRepo
          .createBooking(userId, consultedId, bokingDate, fee, token, context)
          .then((value) async {
        if (value!.success == true) {
      
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
}
