import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gfo/ui/globalWidgets/buttonBig.dart';
import 'package:gfo/ui/globalWidgets/search_field.dart';
import 'package:gfo/utils/colors.dart';
import 'package:gfo/utils/routes/routesName.dart';

class SellerAddInventoryGeneralScreen extends StatefulWidget {
  Map<String, dynamic>? arguments;
  SellerAddInventoryGeneralScreen({super.key, this.arguments});

  @override
  State<SellerAddInventoryGeneralScreen> createState() =>
      _SellerAddInventoryGeneralScreenState();
}

class _SellerAddInventoryGeneralScreenState
    extends State<SellerAddInventoryGeneralScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController requiredPriceController = TextEditingController();
  TextEditingController salePriceController = TextEditingController();
  TextEditingController descController = TextEditingController();

  String? managesStock;
  String? sdk;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    managesStock = widget.arguments!['isManageStock'];
    sdk = widget.arguments!['Sdk'];
  }

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
            Navigator.pushNamed(context, RoutesName.SellerAddGalleryScreen,
                arguments: {
                  "title": titleController.text,
                  "requiredPrice": requiredPriceController.text,
                  "salePrice": salePriceController.text,
                  "desc": descController.text,
                  "Sdk": sdk,
                  "isManageStock": managesStock
                });
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
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                child: SearchFields(
                    controller: titleController,
                    hintText: 'Title',
                    height: 55)),
            SizedBox(
              height: 20,
            ),
            Container(
                decoration: BoxDecoration(
                    color: greyColor, borderRadius: BorderRadius.circular(5)),
                child: SearchFields(
                    controller: requiredPriceController,
                    hintText: 'Required Price',
                    height: 55)),
            SizedBox(
              height: 20,
            ),
            Container(
                decoration: BoxDecoration(
                    color: greyColor, borderRadius: BorderRadius.circular(5)),
                child: SearchFields(
                    controller: salePriceController,
                    hintText: 'Sale Price (Show to customer)',
                    height: 55)),
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
          TextFormField(
            maxLines: 10,
            controller: descController,
            decoration: InputDecoration(
              hintText: "description",
              filled: true,
              fillColor: colorLight1,
              hintStyle: TextStyle(color: colorLight3),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
          
                borderSide: BorderSide(color: colorLight3, width: 1)
              )
            ),
          ),
          ]),
        ),
      ),
    );
  }
}
