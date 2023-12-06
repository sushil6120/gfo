import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gfo/utils/colors.dart';
import 'package:gfo/utils/valueConstants.dart';
import 'package:pinput/pinput.dart';

import '../../utils/routes/routesName.dart';
import '../globalWidgets/buttonBig.dart';

class LoginOtpVerifyScreen extends StatefulWidget {
  const LoginOtpVerifyScreen({super.key});

  @override
  State<LoginOtpVerifyScreen> createState() => _LoginOtpVerifyScreenState();
}

class _LoginOtpVerifyScreenState extends State<LoginOtpVerifyScreen> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: colorDark2),
        borderRadius: BorderRadius.circular(4),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: primaryColor),
      borderRadius: BorderRadius.circular(4),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: colorLightWhite
      ),
    );
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: verticalSpaceLarge,
                ),
                child: Text(
                  "OTP Verification",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 32, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            SizedBox(
              height: verticalSpaceLarge,
            ),
            Center(
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Enter the code from the sms we sent to\n',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: colorDark3,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                    children: <TextSpan>[
                      TextSpan(
                          text: '+8801774280874',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: colorDark1),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigator.pushNamed(context, RoutesName.signUpScreen);
                            }),
                    ],
                  )),
            ),
            SizedBox(height: verticalSpaceMedium),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: verticalSpaceLarge,
                ),
                child: Text(
                  "02:32",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: primaryColor),
                ),
              ),
            ),
            SizedBox(height: verticalSpaceSmall),
            Pinput(
              length: 4,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              validator: (s) {
                return s == '2222' ? null : 'Pin is incorrect';
              },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onCompleted: (pin) => print(pin),
            ),
            SizedBox(height: verticalSpaceLarge,),
               Center(
              child: RichText(
                  text: TextSpan(
                text: 'I did not receive any code. ',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: colorDark3,fontWeight: FontWeight.w400, fontSize: 14),
                children: <TextSpan>[
                  TextSpan(
                      text: 'RESEND  ',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
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
          fontSize: 14,
          onTap: () {
            if (kDebugMode) {
              print("working");
            }
            Navigator.pushNamed(context, RoutesName.rolesScreen);
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
      ),
    );
  }
}
