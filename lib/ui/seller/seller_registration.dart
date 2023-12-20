import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gfo/model/seller/sellerProfileModel.dart';
import 'package:gfo/services/sharedPreferencesServices/sharedPreferences.dart';
import 'package:gfo/ui/globalWidgets/searchTextFormFieldBig.dart';
import 'package:gfo/viewmodel/authviewmodel.dart';
import 'package:provider/provider.dart';
import '../../utils/colors.dart';
import '../../utils/valueConstants.dart';
import '../globalWidgets/buttonBig.dart';

class SellerRegistratinScreen extends StatefulWidget {
  Map<String, dynamic>? arguments;
  SellerRegistratinScreen({super.key, this.arguments});

  @override
  State<SellerRegistratinScreen> createState() =>
      _SellerRegistratinScreenState();
}

TextEditingController businessname = TextEditingController();
TextEditingController ifsc = TextEditingController();
TextEditingController address = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController gst = TextEditingController();
TextEditingController panNo = TextEditingController();
TextEditingController bankAccName = TextEditingController();
TextEditingController bankAccNo = TextEditingController();
TextEditingController reBankAccNo = TextEditingController();

class _SellerRegistratinScreenState extends State<SellerRegistratinScreen> {
  String? token;
  SharedPreferencesViewModel sharedPreferencesViewModel =
      SharedPreferencesViewModel();
  Data? profileData;
  bool isEdit = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileData = widget.arguments!['profileData'];
    isEdit = widget.arguments!['isEdit'];

    Future.wait([sharedPreferencesViewModel.getSellerSignUpToken()])
        .then((value) {
      token = value[0];
      if (isEdit == true) {
        businessname.text = profileData!.bankAccName.toString();
        ifsc.text = profileData!.ifcsCode.toString();
        address.text = profileData!.address.toString();
        email.text = profileData!.email.toString();
        bankAccName.text = profileData!.bankAccName.toString();
        bankAccNo.text = profileData!.accNo.toString();
        reBankAccNo.text = profileData!.accNo.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          iconTheme: IconThemeData(color: colorDark1),
          centerTitle: true,
          actions: [
      
        
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
                  isEdit == true? "Edit Profile":"Registration",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w700, fontSize: 28),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 18, right: 18, top: verticalSpaceSmall),
                child: SearchTextFormFieldBig(
                  height: 55,
                  hintText: "Business Name",
                  controller: businessname,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 18, right: 18, top: verticalSpaceSmall),
                child: SearchTextFormFieldBig(
                  height: 55,
                  hintText: "Email Id",
                  controller: email,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 18, right: 18, top: verticalSpaceSmall),
                child: SearchTextFormFieldBig(
                  height: 55,
                  hintText: "GST No.",
                  controller: gst,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 18, right: 18, top: verticalSpaceSmall),
                child: SearchTextFormFieldBig(
                  height: 55,
                  hintText: "Pan No",
                  controller: panNo,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 18, right: 18, top: verticalSpaceSmall),
                child: SearchTextFormFieldBig(
                  height: 55,
                  hintText: "Address",
                  controller: address,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 18, right: 18, top: verticalSpaceSmall),
                child: Container(
                  decoration: BoxDecoration(
                      color: colorLight3.withOpacity(.1),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Upload Adhar Card",
                          style: TextStyle(fontSize: 12),
                        ),
                        Icon(Icons.upload),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 18, right: 18, top: verticalSpaceSmall),
                child: Container(
                  decoration: BoxDecoration(
                      color: colorLight3.withOpacity(.1),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Upload Pen Card",
                          style: TextStyle(fontSize: 12),
                        ),
                        Icon(Icons.upload),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 18, right: 18, top: verticalSpaceSmall),
                child: Container(
                  decoration: BoxDecoration(
                      color: colorLight3.withOpacity(.1),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Upload Education Documents",
                          style: TextStyle(fontSize: 12),
                        ),
                        Icon(Icons.upload),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 18,
                  top: verticalSpaceSmall,
                ),
                child: Text(
                  "Bank Deatils",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w700, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 18, right: 18, top: verticalSpaceSmall2),
                child: SearchTextFormFieldBig(
                  height: 55,
                  hintText: "Account holder name",
                  controller: bankAccName,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 18, right: 18, top: verticalSpaceSmall),
                child: SearchTextFormFieldBig(
                  height: 55,
                  hintText: "Account no.",
                  controller: bankAccNo,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 18, right: 18, top: verticalSpaceSmall),
                child: SearchTextFormFieldBig(
                  height: 55,
                  hintText: "Re-enter account no.",
                  controller: reBankAccNo,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 18, right: 18, top: verticalSpaceSmall),
                child: SearchTextFormFieldBig(
                  height: 55,
                  hintText: "IFSC Code",
                  controller: ifsc,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Consumer<AuthViewModel>(
          builder: (context, value, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 25),
              child: ButtonBig(
                fontSize: 14,
                onTap: () {
                  if (kDebugMode) {
                    print("working");
                  }
                  var data = jsonEncode({
                    "businessName": businessname.text,
                    "email": email.text,
                    "address": address.text,
                    "gstNo": gst.text,
                    "bankAccName": bankAccName.text,
                    "AccNo": bankAccNo.text,
                    "reAccNo": reBankAccNo.text,
                    "ifcsCode": ifsc.text,
                    "panCard": panNo.text
                  });
                  value.sellerRegisterAPI(data, token.toString(), isEdit!, context);
                },
                backgroundColor: primaryColor,
                backgroundColor2: primaryColor,
                width: double.infinity,
                height: 55,
                text: "Submit",
                showProgress: false,
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
