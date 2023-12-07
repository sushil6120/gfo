import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gfo/ui/globalWidgets/buttonBig.dart';
import 'package:gfo/ui/globalWidgets/search_field.dart';
import 'package:gfo/ui/seller/seller_add_inventory_general_screen.dart';
import 'package:gfo/ui/seller/seller_add_inventory_general_screen.dart';
import 'package:gfo/utils/colors.dart';
import 'package:gfo/utils/routes/routesName.dart';

class SellerAddInventoryGeneralScreen extends StatefulWidget {
  const SellerAddInventoryGeneralScreen({super.key});

  @override
  State<SellerAddInventoryGeneralScreen> createState() =>
      _SellerAddInventoryGeneralScreenState();
}

class _SellerAddInventoryGeneralScreenState
    extends State<SellerAddInventoryGeneralScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 25),
        child: ButtonBig(
          fontSize: 14,
          onTap: () {
            if (kDebugMode) {
              print("working");
            }
            Navigator.pushNamed(
                context, RoutesName.SellerAddInventoryGeneralScreen);
          },
          backgroundColor: secondaryColorLight,
          backgroundColor2: secondaryColorLight,
          width: double.infinity,
          height: 55,
          text: "Next",
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
      appBar: AppBar(
        centerTitle: true,
        iconTheme: Theme.of(context).iconTheme,
        elevation: 0,
        title: Text(
          'Add Product',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(CupertinoIcons.bell),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 20,
          ),
          Text('Inventory General\ninformation',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black)),
          SizedBox(
            height: 20,
          ),
          Container(
              decoration: BoxDecoration(
                  color: greyColor, borderRadius: BorderRadius.circular(5)),
              child: SearchFields(hintText: 'Title', height: 55)),
          SizedBox(
            height: 20,
          ),
          Container(
              decoration: BoxDecoration(
                  color: greyColor, borderRadius: BorderRadius.circular(5)),
              child: SearchFields(hintText: 'Required Price', height: 55)),
          SizedBox(
            height: 20,
          ),
          Container(
              decoration: BoxDecoration(
                  color: greyColor, borderRadius: BorderRadius.circular(5)),
              child: SearchFields(
                  hintText: 'Sale Price (Show to customer)', height: 55)),
          SizedBox(
            height: 30,
          ),
          Text('Description',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.black)),
          SizedBox(
            height: 20,
          ),
          Container(
              decoration: BoxDecoration(
                  color: greyColor, borderRadius: BorderRadius.circular(5)),
              child: SearchFields(hintText: 'Describe here...', height: 115))
        ]),
      ),
    );
  }
}
