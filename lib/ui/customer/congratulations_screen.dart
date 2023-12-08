import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gfo/ui/globalWidgets/buttonBig.dart';
import 'package:gfo/utils/responsive.dart';
import 'package:gfo/utils/routes/routesName.dart';
import 'package:gfo/utils/valueConstants.dart';
import 'package:lottie/lottie.dart';

import '../../utils/colors.dart';

class CongrotulationsScreen extends StatefulWidget {
  const CongrotulationsScreen({super.key});

  @override
  State<CongrotulationsScreen> createState() => _PaymentOptionsScreenState();
}

class _PaymentOptionsScreenState extends State<CongrotulationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 body: SingleChildScrollView(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(height: context.deviceHeight*.18,),
          Center(child: Lottie.asset('assets/Animation - 1695104068632.json',)),
             Padding(
              padding: const EdgeInsets.only(
                 top: verticalSpaceSmall2, bottom: 10),
              child: Text(
                "Congratulations!!!",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w700, fontSize: 18, color: Color(0xff27214D)),
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(
                 top: verticalSpaceSmall2, bottom: 10),
              child: Text(
                "Your order have been taken\nand is being attended to",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w400, fontSize: 16, color: Color(0xff27214D)),
              ),
            ),
             Padding(
            padding:  EdgeInsets.symmetric(horizontal: context.deviceWidth*.2, vertical: context.deviceHeight*.18),
            child: ButtonBig(
              fontSize: 14,
              onTap: () {
                if (kDebugMode) {
                  print("working");
                }
                Navigator.pushNamedAndRemoveUntil(context, RoutesName.bottomNavigationBarScreen, (route) => false);
              },
              backgroundColor: greenColor.withOpacity(.6),
              backgroundColor2: greenColor.withOpacity(.6),
              width: double.infinity,
              height: 55,
              text: "Continue shopping",
              showProgress: false,
              progressColor: colorLightWhite,
              progressStrokeWidth: 1.5,
              radius: 10,
              textColor: colorLightWhite,
              letterSpacing: 0,
              progressPadding: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
    ],
  ),
 ),
    );
  }
}