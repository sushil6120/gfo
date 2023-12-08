import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gfo/ui/globalWidgets/searchTextFormFieldBig.dart';

import '../../utils/colors.dart';
import '../../utils/valueConstants.dart';
import '../globalWidgets/buttonBig.dart';

class ApplyNocScreen extends StatefulWidget {
  const ApplyNocScreen({super.key});

  @override
  State<ApplyNocScreen> createState() => _CustomerAddNewAddressScreenState();
}

class _CustomerAddNewAddressScreenState extends State<ApplyNocScreen> {
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
          IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.cart,
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
              padding: const EdgeInsets.only(left: 18, right: 18, top: verticalSpaceSmall),
              child: SearchTextFormFieldBig(height: 55, hintText: "Name",),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: verticalSpaceSmall),
              child: SearchTextFormFieldBig(height: 55, hintText: "Contact",),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: verticalSpaceSmall),
              child: SearchTextFormFieldBig(height: 55, hintText: "Address",),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: verticalSpaceSmall),
              child: SearchTextFormFieldBig(height: 55, hintText: "Pin-code",),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: verticalSpaceSmall),
              child: SearchTextFormFieldBig(height: 55, hintText: "Select Property type",),
            ),
          ],
        ),
      ),
      bottomNavigationBar:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 25),
            child: ButtonBig(
              fontSize: 14,
              onTap: () {
                if (kDebugMode) {
                  print("working");
                }
                // Navigator.pushNamed(context, RoutesName.checkOutScreen);
              },
              backgroundColor: greenColor.withOpacity(.6),
              backgroundColor2: greenColor.withOpacity(.6),
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