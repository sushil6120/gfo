import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gfo/utils/responsive.dart';

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
  String countryCode = "+91";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor:primaryColor,
        title: Text(
          "LogIn",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontSize: 18,color: colorLightWhite, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: verticalSpaceLarge,
            ),
          
            SizedBox(
              height: verticalSpaceMedium,
            ),
            CountryCodePicker(
              hideMainText: true,
              showDropDownButton: true,
              textStyle: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 15, fontWeight: FontWeight.w400),
              onChanged: (value) {
                countryCode = value.dialCode.toString();
                setState(() {});
              },
              initialSelection: 'IN',
              favorite: ['+91', 'IN'],
              showCountryOnly: true,
              showOnlyCountryWhenClosed: false,
              alignLeft: false,
            ),
            Container(
              width: context.deviceWidth,
              height: context.deviceHeight * .062,
              margin: EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: primaryColor, width: 1)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      countryCode,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                      child: SearchFields(
                        lengthLimitingTextInputFormatter: [LengthLimitingTextInputFormatter(10)],
                        textInpuType: TextInputType.phone,
                    hintText: "Enter Mobile Number",
                    height: null,
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
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: colorDark3,fontWeight: FontWeight.w400, fontSize: 14),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Sign Up ',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: primaryColor),
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 25),
        child: ButtonBig(
          fontSize: 16,
          onTap: () {
            if (kDebugMode) {
              print("working");
            }
            // Navigator.pushNamed(context, RoutesName.loginOtpVerify);
          },
          backgroundColor: primaryColor,
          backgroundColor2: primaryColor,
          width: double.infinity,
          height: 55,
          text: "Get OTP",
          showProgress: false,
          progressColor: colorLightWhite,
          progressStrokeWidth: 1.5,
          radius: 5,
          textColor: colorLightWhite,
          letterSpacing: 0,
          progressPadding: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
