import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gfo/ui/globalWidgets/buttonBig.dart';
import 'package:gfo/ui/globalWidgets/search_field.dart';
import 'package:gfo/utils/colors.dart';
import 'package:gfo/utils/routes/routesName.dart';
// import 'package:gfo/ui/globalWidgets/searchTextFormFieldBig.dart';
// import 'package:gfo/ui/globalWidgets/textFormFieldBig.dart';
// import 'package:gfo/ui/seller/seller_add_inventory_general_screen.dart';

class SellerAddInventoryScreen extends StatefulWidget {
  const SellerAddInventoryScreen({super.key});

  @override
  State<SellerAddInventoryScreen> createState() => _AddInventoryScreenState();
}

class _AddInventoryScreenState extends State<SellerAddInventoryScreen> {
  bool _checkbox = false;
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text('Add Inventory',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.black)),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
                decoration: BoxDecoration(
                    color: greyColor, borderRadius: BorderRadius.circular(5)),
                child: SearchFields(hintText: 'SDK', height: 55)),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Checkbox(
              value: _checkbox,
              onChanged: (value) {
                setState(() {
                  _checkbox = !_checkbox;
                });
              },
            ),
            title: Text('Manage Stock?',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.black)),
            subtitle: Text('Enable Stock management at Product level.',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontSize: 12, fontWeight: FontWeight.w400)),
          )
        ],
      ),
    );
  }
}
