import 'dart:convert';

import 'package:gfo/model/consultant/ConsultantUserSingleDataModel.dart';
import 'package:gfo/model/consultant/consultantProfileModel.dart';
import 'package:gfo/model/consultant/consultantgetbookeduser.dart';
import 'package:gfo/utils/app_url.dart';
import  'package:http/http.dart' as http;
// import '.package:gfo/';

class ConsultantRepo {
    ConsultantGetBokedUserModel ? consultantGetBokedUserModel;
    ConsultantProfileModel ? consultantProfileModel;
    ConsultantUserSingleDataModel ? consultantUserSingleDataModel;
    Future<ConsultantGetBokedUserModel?> ConsultantGetAllBookedUser(String token) async {
    try {
      final response = await http.get(
        Uri.parse(AppUrl.consultantGetBookedUser),
        headers: {"Content-type": "application/json","Authorization":"Bearer $token"},
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        print(data);
        consultantGetBokedUserModel = ConsultantGetBokedUserModel.fromJson(data);
      } else {
        print(data);
      }
      return consultantGetBokedUserModel;
    } catch (e) {
      print(e);
    }
    return consultantGetBokedUserModel;
  }
// consultant user single data
Future<ConsultantUserSingleDataModel?> ConsultantGetSingleBookedUser(String token ,id) async {
    try {
      final response = await http.get(
        Uri.parse(AppUrl.consultantGetUserSingleData + id),
        headers: {"Content-type": "application/json","Authorization":"Bearer $token"},
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        print(data);
        consultantUserSingleDataModel = ConsultantUserSingleDataModel.fromJson(data);
      } else {
        print(data);
      }
      return consultantUserSingleDataModel;
    } catch (e) {
      print(e);
    }
    return consultantUserSingleDataModel;
  }

  // consultant profile repo
   Future<ConsultantProfileModel?> Consultantprofile(String token) async {
    try {
      final response = await http.get(
        Uri.parse(AppUrl.consultantProfile),
        headers: {"Content-type": "application/json","Authorization":"Bearer $token"},
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        print(data);
        consultantProfileModel = ConsultantProfileModel.fromJson(data);
      } else {
        print(data);
      }
      return consultantProfileModel;
    } catch (e) {
      print(e);
    }
    return consultantProfileModel;
  }
}