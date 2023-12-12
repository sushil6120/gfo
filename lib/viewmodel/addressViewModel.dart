import 'package:flutter/material.dart';
import 'package:gfo/repository/costumerRepo/address_Repo.dart';

import '../utils/colors.dart';
import '../utils/utilsFunction.dart';

class AddressViewModel with ChangeNotifier {
  AddressRepo addressRepo = AddressRepo();
  AddressViewModel? addressViewModel;

  bool loading = false;

  setLoading(bool value) {
    loading = value;

    notifyListeners();
  }

  Future<void> addAddressApis(String pincode, address, locality, city,
      state,token, BuildContext context) async {
    setLoading(true);
    try {
      await addressRepo
          .addAddressApi(pincode, address, locality, city, state, token, context)
          .then((value) async {
        // Navigator.pushNamedAndRemoveUntil(context, RoutesName.bottomNavigationBarScreen, (route) => false);
        if (value!.success == true) {
          Utils.flushBarErrorMessage("Address Added Successfull", context,
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
