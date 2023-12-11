import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gfo/ui/globalWidgets/searchTextFormFieldBig.dart';
import 'package:gfo/viewmodel/addressViewModel.dart';
import 'package:provider/provider.dart';

import '../../services/sharedPreferencesServices/sharedPreferences.dart';
import '../../utils/colors.dart';
import '../../utils/valueConstants.dart';
import '../globalWidgets/buttonBig.dart';

class CustomerAddNewAddressScreen extends StatefulWidget {
  const CustomerAddNewAddressScreen({super.key});

  @override
  State<CustomerAddNewAddressScreen> createState() =>
      _CustomerAddNewAddressScreenState();
}

class _CustomerAddNewAddressScreenState
    extends State<CustomerAddNewAddressScreen> {
  TextEditingController pinController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController localityController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();

  SharedPreferencesViewModel sharedPreferencesViewModel =
      SharedPreferencesViewModel();
  String? token;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.wait([sharedPreferencesViewModel.getToken()]).then((value) {
      token = value[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          iconTheme: const IconThemeData(color: colorDark1),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.bell,
                  color: colorDark2,
                )),
            const SizedBox(
              width: 5,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 18, top: verticalSpaceSmall2, bottom: 10),
                child: Text(
                  "Add new address",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w700, fontSize: 28),
                ),
              ),
               Padding(
                padding: EdgeInsets.only(
                    left: 18, right: 18, top: verticalSpaceSmall),
                child: SearchTextFormFieldBig(
                  controller: pinController,
                  height: 55,
                  hintText: "Pin Code",
                ),
              ),
               Padding(
                padding: EdgeInsets.only(
                    left: 18, right: 18, top: verticalSpaceSmall),
                child: SearchTextFormFieldBig(
                  controller: addressController,
                  height: 55,
                  hintText: "Address (House No., Building, Street, Area)",
                ),
              ),
               Padding(
                padding: EdgeInsets.only(
                    left: 18, right: 18, top: verticalSpaceSmall),
                child: SearchTextFormFieldBig(
                  controller: localityController,
                  height: 55,
                  hintText: "Locality / Town",
                ),
              ),
               Padding(
                padding: EdgeInsets.only(
                    left: 18, right: 18, top: verticalSpaceSmall),
                child: SearchTextFormFieldBig(
                  controller: cityController,
                  height: 55,
                  hintText: "City / District",
                ),
              ),
             Padding(
                padding: EdgeInsets.only(
                    left: 18, right: 18, top: verticalSpaceSmall),
                child: SearchTextFormFieldBig(
                  controller: stateController,
                  height: 55,
                  hintText: "State",
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Consumer<AddressViewModel>(
          builder: (context, value, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 25),
              child: ButtonBig(
                fontSize: 14,
                onTap: () {
                  if (kDebugMode) {
                    print("working");
                  }
                  value.addAddressApis(
                      pinController.text,
                      addressController.text,
                      localityController.text,
                      cityController.text,
                      stateController.text,
                      token,
                      context);
                },
                backgroundColor: greenColor.withOpacity(.6),
                backgroundColor2: greenColor.withOpacity(.6),
                width: double.infinity,
                height: 55,
                text: "Save",
                showProgress: value.loading,
                progressColor: colorLightWhite,
                progressStrokeWidth: 1.5,
                radius: 5,
                textColor: colorLightWhite,
                letterSpacing: 0,
                progressPadding: 20,
                fontWeight: FontWeight.w700,
              ),
            );
          },
        ));
  }
}
