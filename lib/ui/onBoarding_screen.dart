import 'package:flutter/material.dart';
import 'package:gfo/utils/colors.dart';
import 'package:gfo/utils/responsive.dart';
import 'package:gfo/utils/routes/routesName.dart';
import 'package:gfo/utils/valueConstants.dart';
import 'package:lottie/lottie.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: verticalSpaceMedium,
          ),
          Container(
            width: context.deviceWidth,
            margin: EdgeInsets.only(top: verticalSpaceLarge, left: 18,right: 18),
            padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            decoration: BoxDecoration(
                border: Border.all(color: colorLightWhite),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "In the realm of fire safety, having a reliable and user-friendly fire extinguisher application is paramount. This digital tool serves as an essential companion, providing crucial information and guidance in the event of a fire emergency. In this section, we will delve into the key features and functionalities that make a fire extinguisher app indispensable.",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: colorLightWhite),
                ),
                SizedBox(
                  height: verticalSpaceSmall,
                ),
             
              ],
            ),
          ),
          Lottie.asset("assets/Animation - 1702894539062.json", )
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward, color: primaryColor,),
        elevation: 2,
        backgroundColor: colorLightWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: () {
        Navigator.pushNamed(context, RoutesName.splashScreen);
      },),
    );
  }
}
