import 'dart:convert';

import 'package:gfo/model/consultant/consultantgetbookeduser.dart';
import 'package:gfo/utils/app_url.dart';
import  'package:http/http.dart' as http;

class ConsultantRepo {
    ConsultantGetBokedUserModel ? consultantGetBokedUserModel;

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
}