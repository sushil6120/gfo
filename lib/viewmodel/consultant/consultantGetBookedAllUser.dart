import 'package:flutter/material.dart';
import 'package:gfo/model/consultant/consultantProfileModel.dart';
import 'package:gfo/model/consultant/consultantgetbookeduser.dart';
import 'package:gfo/repository/consultantRepo/consultantGetbookedUser.dart';
import 'package:gfo/response/apiResponse.dart';

class ConsultantViewModelHome with ChangeNotifier {
  ConsultantRepo  consultantRepo = ConsultantRepo();
  ConsultantGetBokedUserModel ? consultantGetBokedUserModel;
  ConsultantProfileModel ? consultantProfileModel;

  ApiResponse<dynamic> consultantData = ApiResponse.loading();

  setHomeScreenData(ApiResponse<dynamic> response) {
    consultantData = response;
    notifyListeners();
  }

  Future<void> ConsultantGetAllBookedUserApi(String token) async {
    setHomeScreenData(ApiResponse.loading());
    try {
      await consultantRepo.ConsultantGetAllBookedUser(token).then((value) async {
        print(value!.message);
        consultantGetBokedUserModel = value;
        setHomeScreenData(ApiResponse.completed(consultantGetBokedUserModel));
        notifyListeners();
      }).onError((error, stackTrace) {
        setHomeScreenData(ApiResponse.error(error.toString()));
      });
    } catch (e) {
      print("exception:" + e.toString());
    }
  }
// consultant profile
   Future<void> ConsultantprofileApi(String token) async {
    setHomeScreenData(ApiResponse.loading());
    try {
      await consultantRepo.Consultantprofile(token).then((value) async {
        print(value!.message);
        consultantProfileModel = value;
        setHomeScreenData(ApiResponse.completed(consultantProfileModel));
        notifyListeners();
      }).onError((error, stackTrace) {
        setHomeScreenData(ApiResponse.error(error.toString()));
      });
    } catch (e) {
      print("exception:" + e.toString());
    }
  }
}