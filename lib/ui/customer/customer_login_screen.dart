import 'package:country_calling_code_picker/functions.dart';
// import 'package:country_code_picker/country_code_picker.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gfo/utils/responsive.dart';
import 'package:gfo/utils/routes/routesName.dart';
import 'package:gfo/viewmodel/authviewmodel.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';
import '../../utils/valueConstants.dart';
import '../globalWidgets/buttonBig.dart';
import '../globalWidgets/search_field.dart';

class CustomerLoginScreen extends StatefulWidget {
  const CustomerLoginScreen({super.key});

  @override
  State<CustomerLoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<CustomerLoginScreen> {
  TextEditingController phoneController = TextEditingController();
  String countryCode = "+91";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: primaryColor,
          title: Text(
            "LogIn",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 18,
                color: colorLightWhite,
                fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: verticalSpaceLarge,
                    left: 14,
                    right: verticalSpaceLarge),
                child: Text(
                  "Verify your\n phone number",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 32, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: verticalSpaceSmall, left: 18, right: 18),
                child: Text(
                  "We have send you an One Time Password(OTP) on this mobile number.",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: context.deviceHeight * .08,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: verticalSpaceLarge, left: 18, right: 18, bottom: 10),
                child: Text(
                  "Enter mobile no.*",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 18,
                ),
                child: Row(
                  children: [
                    Container(
                      width: context.deviceWidth * .16,
                      height: context.deviceHeight * .058,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: colorDark3.withOpacity(.4), width: .8)),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            _showCountryPicker();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                countryCode.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: colorDark3,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: colorDark3.withOpacity(.4), width: .8)),
                      child: SearchFields(
                        controller: phoneController,
                        lengthLimitingTextInputFormatter: [
                          LengthLimitingTextInputFormatter(10)
                        ],
                        textInpuType: TextInputType.phone,
                        hintText: "Enter Mobile Number",
                        height: null,
                      ),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: verticalSpaceMedium,
              ),
              Center(
                child: RichText(
                    text: TextSpan(
                  text: 'Don’t have an account?  ',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: colorDark3,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Continue without account',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: greenColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigator.pushNamed(context, RoutesName.signUpScreen);
                          }),
                  ],
                )),
              )
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
                  value.loginSendApis(phoneController.text, context);
                  // Navigator.pushNamed(context, RoutesName.loginOtpVerify);
                  /// Default.
                },
                backgroundColor: primaryColor,
                backgroundColor2: primaryColor,
                width: double.infinity,
                height: 55,
                text: "Get Code",
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

  void _showCountryPicker() async {
    final country = await showCountryPickerDialog(
      context,
    );
    if (country != null) {
      setState(() {
        countryCode = country.callingCode.toString();
      });
    }
  }
}
