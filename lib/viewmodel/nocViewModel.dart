import 'package:flutter/material.dart';
import 'package:gfo/model/costumer/applyNocModel.dart';
import 'package:gfo/repository/costumerRepo/nocRepo.dart';
import 'package:gfo/utils/colors.dart';
import 'package:gfo/utils/routes/routesName.dart';

import '../utils/utilsFunction.dart';

class NocViewModel with ChangeNotifier {
  NocRepo nocRepo = NocRepo();
  ApplyNocModel? applyNocModel;

  bool loading = false;

  setLoading(bool value) {
    loading = value;

    notifyListeners();
  }

  Future<void> applyNocApis(String name, place, contact, address, date, pincode,
      selectOption, token, BuildContext context) async {
    setLoading(true);
    try {
      await nocRepo
          .applyNocAPi(name, place, contact, address, date, pincode,
              selectOption, token, context)
          .then((value) async {
        if (value!.message == "FireNoc form submitted successfully") {
          Navigator.pushNamedAndRemoveUntil(context, RoutesName.bottomNavigationBarScreen, (route) => false);
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
