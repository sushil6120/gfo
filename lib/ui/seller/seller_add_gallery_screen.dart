import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gfo/services/sharedPreferencesServices/sharedPreferences.dart';
import 'package:gfo/utils/colors.dart';
import 'package:gfo/utils/responsive.dart';
import 'package:gfo/utils/valueConstants.dart';
import 'package:gfo/viewmodel/seller/addProductViewModel.dart';
import 'package:provider/provider.dart';

import '../../utils/utilsFunction.dart';

class SellerAddGalleryScreen extends StatefulWidget {
  Map<String, dynamic>? arguments;
  SellerAddGalleryScreen({super.key, this.arguments});

  @override
  State<SellerAddGalleryScreen> createState() => _SellerAddGalleryScreenState();
}

class _SellerAddGalleryScreenState extends State<SellerAddGalleryScreen> {
  SharedPreferencesViewModel _sharedPreferencesViewModel =
      SharedPreferencesViewModel();
  String? token;
  String? title;
  String? sdk;
  String? manageStock;
  String? requiredPrice;
  String? salePrice;
  String? desc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    manageStock = widget.arguments!['isManageStock'];
    sdk = widget.arguments!['Sdk'];
    title = widget.arguments!['title'];
    requiredPrice = widget.arguments!['requiredPrice'];
    salePrice = widget.arguments!['salePrice'];
    desc = widget.arguments!['desc'];

    print("$manageStock $sdk $title $requiredPrice $salePrice $desc");
    Future.wait([_sharedPreferencesViewModel.getSellerToken()]).then((value) {
      print(value[0]);
      token = value[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: Consumer<AddProductViewModel>(
          builder: (context, value, child) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text('Add Gallery',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black)),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Item Thumbnail',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black)),
                          GestureDetector(
                            onTap: () {
                              if (title!.isEmpty ||
                                  desc!.isEmpty ||
                                  requiredPrice!.isEmpty ||
                                  salePrice!.isEmpty) {
                                Utils.flushBarErrorMessage(
                                    "Full All The Filds!",
                                    context,
                                    Icons.error,
                                    colorLightWhite,
                                    primaryColor);
                              } else {
                                value.uplaodProductApi(
                                    title.toString(),
                                    sdk.toString(),
                                    desc,
                                    requiredPrice,
                                    salePrice,
                                    "category",
                                    "brand",
                                    "29",
                                    "tags",
                                    "city",
                                    manageStock,
                                    "stockStatus",
                                    "20",
                                    "allowStockOrders",
                                    "lowStockHolder",
                                    token.toString(),
                                    context);
                              }
                            },
                            child: Text('Upload',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: secondaryColorLight)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          value.pickSingleImage();
                        },
                        child: Container(
                          height: 335,
                          width: 350,
                          decoration: BoxDecoration(color: Colors.grey[200]),
                          child: Center(
                              child: value.selectedImage == null
                                  ? Icon(
                                      Icons.image,
                                      color: colorLight3,
                                    )
                                  : Image.file(
                                      value.selectedImage!,
                                      fit: BoxFit.cover,
                                    )),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Item Gallery',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black)),
                          value.imageList!.isNotEmpty
                              ? GestureDetector(
                                  onTap: () {
                                    value.pickImages();
                                  },
                                  child: Text('+ Add More',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              color: greenColor)),
                                )
                              : SizedBox()
                        ],
                      ),
                      SizedBox(
                        height: verticalSpaceSmall,
                      ),
                      value.imageList!.isEmpty
                          ? GestureDetector(
                              onTap: () {
                                value.pickImages();
                              },
                              child: Container(
                                width: context.deviceWidth,
                                height: context.deviceHeight * .2,
                                margin:
                                    EdgeInsets.only(top: verticalSpaceSmall2),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: colorLight2, width: 1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Icon(Icons.upload),
                                    ),
                                    Text(
                                      "Upload Images",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    )
                                  ],
                                ),
                              ),
                            )
                          : Expanded(
                              child: GridView.builder(
                                  padding: EdgeInsets.only(
                                      bottom: verticalSpaceLarge),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 3.0,
                                    crossAxisSpacing: 3.0,
                                  ),
                                  itemCount: value.imageList!.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          top: verticalSpaceSmall),
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: context.deviceWidth,
                                            height: context.deviceHeight * .2,
                                            child: Image.file(
                                              File(
                                                  value.imageList![index].path),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Positioned(
                                            right: 0,
                                            top: 0,
                                            child: IconButton(
                                                tooltip: "remove",
                                                onPressed: () {
                                                  value.removeImage(index);
                                                },
                                                icon: Icon(
                                                  Icons.close_rounded,
                                                  color: primaryColor,
                                                )),
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                    ],
                  ),
                ),
                value.loading
                    ? Container(
                        width: context.deviceWidth,
                        height: context.deviceHeight,
                        color: colorLight2.withOpacity(.6),
                        child: const Padding(
                          padding: EdgeInsets.only(bottom: verticalSpaceLarge),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: primaryColor,
                              strokeWidth: 2,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox()
              ],
            );
          },
        ));
  }
}
