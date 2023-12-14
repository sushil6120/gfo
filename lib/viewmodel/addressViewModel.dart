import 'package:flutter/material.dart';
import 'package:gfo/model/costumer/deleteAddressModel.dart' as deleteModel;
import 'package:gfo/model/costumer/getAddressModel.dart';
import 'package:gfo/repository/costumerRepo/address_Repo.dart';
import 'package:gfo/utils/routes/routesName.dart';

import '../response/apiResponse.dart';
import '../utils/colors.dart';
import '../utils/utilsFunction.dart';

class AddressViewModel with ChangeNotifier {
  AddressRepo addressRepo = AddressRepo();

  AddressViewModel? addressViewModel;
  Address? address;
  deleteModel.DeleteAddressApi? deleteAddressApi;

  bool loading = false;
  ApiResponse<dynamic> addressData = ApiResponse.loading();

  setLoading(bool value) {
    loading = value;

    notifyListeners();
  }

  setHomeScreenData(ApiResponse<dynamic> response) {
    addressData = response;
    notifyListeners();
  }

  Future<void> addAddressApis(String pincode, address, locality, city, state,
      token, BuildContext context) async {
    setLoading(true);
    try {
      await addressRepo
          .addAddressApi(
              pincode, address, locality, city, state, token, context)
          .then((value) async {
        // Navigator.pushNamedAndRemoveUntil(context, RoutesName.bottomNavigationBarScreen, (route) => false);
        if (value!.success == true) {
          Navigator.pushReplacementNamed(
              context, RoutesName.customerAddressScreen);
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

  Future<void> deleteAddressAPi(String id, BuildContext context) async {
    setLoading(true);
    try {
      await addressRepo.deletAddress(id, context).then((value) async {
        // Navigator.pushNamedAndRemoveUntil(context, RoutesName.bottomNavigationBarScreen, (route) => false);
        if (value!.success == true) {
          Navigator.pushReplacementNamed(
              context, RoutesName.customerAddressScreen);
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

  Future<void> getAddressApi() async {
    setHomeScreenData(ApiResponse.loading());
    try {
      await addressRepo.addressApi().then((value) async {
        address = value;
        print(address);
        setHomeScreenData(ApiResponse.completed(value));
      }).onError((error, stackTrace) {
        setHomeScreenData(ApiResponse.error(error.toString()));
      });
    } catch (e) {
      print("exception:" + e.toString());
    }
  }
}
