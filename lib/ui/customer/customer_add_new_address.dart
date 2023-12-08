import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gfo/ui/globalWidgets/searchTextFormFieldBig.dart';

import '../../utils/colors.dart';
import '../../utils/valueConstants.dart';
import '../globalWidgets/buttonBig.dart';

class CustomerAddNewAddressScreen extends StatefulWidget {
  const CustomerAddNewAddressScreen({super.key});

  @override
  State<CustomerAddNewAddressScreen> createState() => _CustomerAddNewAddressScreenState();
}

class _CustomerAddNewAddressScreenState extends State<CustomerAddNewAddressScreen> {
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
                "Add new address",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w700, fontSize: 28),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: verticalSpaceSmall),
              child: SearchTextFormFieldBig(height: 55, hintText: "Pin Code",),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: verticalSpaceSmall),
              child: SearchTextFormFieldBig(height: 55, hintText: "Address (House No., Building, Street, Area)",),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: verticalSpaceSmall),
              child: SearchTextFormFieldBig(height: 55, hintText: "Locality / Town",),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: verticalSpaceSmall),
              child: SearchTextFormFieldBig(height: 55, hintText: "City / District",),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: verticalSpaceSmall),
              child: SearchTextFormFieldBig(height: 55, hintText: "State",),
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
              text: "Save",
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