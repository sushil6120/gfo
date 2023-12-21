import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gfo/services/sharedPreferencesServices/sharedPreferences.dart';
import 'package:gfo/ui/globalWidgets/searchTextFormFieldBig.dart';
import 'package:gfo/viewmodel/authviewmodel.dart';
import 'package:provider/provider.dart';

import '../../model/consultant/consultantProfileModel.dart';
import '../../utils/colors.dart';
import '../../utils/valueConstants.dart';
import '../globalWidgets/buttonBig.dart';

class ConsultantRegistratinScreen extends StatefulWidget {
  Map<String, dynamic>? arguments;
  ConsultantRegistratinScreen({super.key, this.arguments});

  @override
  State<ConsultantRegistratinScreen> createState() =>
      _ConsultantRegistratinScreenState();
}

class _ConsultantRegistratinScreenState
    extends State<ConsultantRegistratinScreen> {
  TextEditingController fullName = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController adharNum = TextEditingController();
  TextEditingController penNum = TextEditingController();
  TextEditingController education = TextEditingController();
  TextEditingController fee = TextEditingController();
  TextEditingController designation = TextEditingController();
  TextEditingController experience = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController bio = TextEditingController();
  TextEditingController accountName = TextEditingController();
  TextEditingController accountNumber = TextEditingController();
  TextEditingController reAccountNumber = TextEditingController();
  TextEditingController ifsc = TextEditingController();

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
    Future.wait([
      sharedPreferencesViewModel.getConsultantSignUpToken(),
      sharedPreferencesViewModel.getConsultantToken()
    ]).then((value) {
      token = isEdit ? value[1]: value[0];
    

      if (isEdit == true) {
        fullName.text = profileData!.name.toString();
        ifsc.text = profileData!.ifcsCode.toString();
        address.text = profileData!.address.toString();
        adharNum.text = profileData!.aadhaarNumber.toString();
        penNum.text = profileData!.panNumber.toString();
        contact.text = profileData!.phone.toString();
        bio.text = profileData!.bio.toString();
        pincode.text = profileData!.pinCode.toString();
        designation.text = profileData!.designation.toString();
        experience.text = profileData!.experience.toString();
        education.text = profileData!.education.toString();
        email.text = profileData!.email.toString();
        accountName.text = profileData!.bankAccName.toString();
        accountNumber.text = profileData!.accNo.toString();
        reAccountNumber.text = profileData!.accNo.toString();
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
            IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.bell,
                  color: colorDark2,
                )),
            SizedBox(
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
                  isEdit ? "Edit Profile" : "Registration",
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
                  controller: fullName,
                  height: 55,
                  hintText: "Full Name",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 18, right: 18, top: verticalSpaceSmall),
                child: SearchTextFormFieldBig(
                  height: 55,
                  hintText: "contact",
                  controller: contact,
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
                  controller: adharNum,
                  hintText: "Adhar Number",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 18, right: 18, top: verticalSpaceSmall),
                child: SearchTextFormFieldBig(
                  height: 55,
                  hintText: "Pan No",
                  controller: penNum,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 18, right: 18, top: verticalSpaceSmall),
                child: SearchTextFormFieldBig(
                  height: 55,
                  hintText: "Education",
                  controller: education,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 18, right: 18, top: verticalSpaceSmall),
                child: SearchTextFormFieldBig(
                  height: 55,
                  hintText: "Current or ex-designation ",
                  controller: designation,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 18, right: 18, top: verticalSpaceSmall),
                child: SearchTextFormFieldBig(
                  height: 55,
                  hintText: "Experience",
                  controller: experience,
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
                child: SearchTextFormFieldBig(
                  height: 55,
                  hintText: "Pin code",
                  controller: pincode,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 18, right: 18, top: verticalSpaceSmall),
                child: TextFormField(
                  controller: bio,
                  maxLines: 10,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: colorLight2.withOpacity(.2),
                      hintText: "Bio...",
                      hintStyle: TextStyle(color: colorLight3),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide:
                              BorderSide(color: colorLight3, width: 1))),
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
                    left: 18, right: 18, top: verticalSpaceSmall),
                child: SearchTextFormFieldBig(
                  height: 55,
                  hintText: "Account holder name",
                  controller: accountName,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 18, right: 18, top: verticalSpaceSmall),
                child: SearchTextFormFieldBig(
                  height: 55,
                  hintText: "Account no.",
                  controller: accountNumber,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 18, right: 18, top: verticalSpaceSmall),
                child: SearchTextFormFieldBig(
                  height: 55,
                  hintText: "Re-enter account no.",
                  controller: reAccountNumber,
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
                    "name": fullName.text,
                    "email": email.text,
                    "address": address.text,
                    "gender": "notinoption",
                    "education": education.text,
                    "consultantFee": "600",
                    "bankAccName": accountName.text,
                    "AccNo": accountNumber.text,
                    "reAccNo": reAccountNumber.text,
                    "ifcsCode": ifsc.text,
                    "experience": experience.text,
                    "pinCode": pincode.text,
                    "designation": designation.text,
                    "bio": bio.text,
                    "aadharCard": adharNum.text,
                    "panCard": penNum.text
                  });
                  value.consultantRegistrationApis(
                      data, token.toString(), isEdit, context);
                },
                backgroundColor: greenColor.withOpacity(.6),
                backgroundColor2: greenColor.withOpacity(.6),
                width: double.infinity,
                height: 55,
                text: "Submit",
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
