import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gfo/services/sharedPreferencesServices/sharedPreferences.dart';
import 'package:gfo/ui/globalWidgets/buttonBig.dart';
import 'package:gfo/ui/globalWidgets/search_field.dart';
import 'package:gfo/utils/colors.dart';
import 'package:gfo/utils/responsive.dart';
import 'package:gfo/utils/utilsFunction.dart';
import 'package:gfo/utils/valueConstants.dart';
import 'package:gfo/viewmodel/seller/addProductViewModel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class SellerEditProductScreen extends StatefulWidget {
  Map<String, dynamic>? arguments;
  SellerEditProductScreen({Key? key, this.arguments}) : super(key: key);

  @override
  State<SellerEditProductScreen> createState() =>
      _SellerEditProductScreenState();
}

class _SellerEditProductScreenState extends State<SellerEditProductScreen> {
  TextEditingController sdkController = TextEditingController();
  bool _checkbox = false;
  String? sdk, isManageStock, title, requiredPrice, salePrice, desc;
  String? thumbnail;
  List<dynamic>? images;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sdk = widget.arguments!['sku'];
    isManageStock = widget.arguments!['isManageStock'];
    requiredPrice = widget.arguments!['requiredPrice'];
    salePrice = widget.arguments!['salePrice'];
    desc = widget.arguments!['desc'];
    images = widget.arguments!['images'];
    title = widget.arguments!['title'];
    thumbnail = widget.arguments!['thumbnail'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: Theme.of(context).iconTheme,
        elevation: 0,
        title: Text(
          'Edit Product',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(CupertinoIcons.bell),
          ),
        ],
      ),
      body: SellerAddInventoryForm(
        desc: desc,
        title: title,
        isManageStock: isManageStock,
        requiredPrice: requiredPrice,
        salePrice: salePrice,
        sdk: sdk,
        thumbnail: thumbnail,
        images: images,
      ),
    );
  }
}

class SellerAddInventoryForm extends StatefulWidget {
  String? sdk, isManageStock, title, requiredPrice, salePrice, desc;
  String? thumbnail;
  List<dynamic>? images;
  SellerAddInventoryForm(
      {super.key,
      this.sdk,
      this.isManageStock,
      this.title,
      this.requiredPrice,
      this.salePrice,
      this.desc,
      this.thumbnail,
      this.images});

  @override
  State<StatefulWidget> createState() {
    return _SellerAddInventoryFormState();
  }
}

class _SellerAddInventoryFormState extends State<SellerAddInventoryForm> {
  final PageController _pageController = PageController();
  TextEditingController titleController = TextEditingController();
  TextEditingController requiredPriceController = TextEditingController();
  TextEditingController salePriceController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController sdkController = TextEditingController();
  String? managesStock;
  String? sdk;
  bool loading = false;
  bool _checkbox = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController.text = widget.title.toString();
    requiredPriceController.text = widget.requiredPrice.toString();
    salePriceController.text = widget.salePrice.toString();
    descController.text = widget.desc.toString();
    sdkController.text = widget.sdk.toString();
    if (widget.isManageStock == "Yes") {
      _checkbox = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: [
        _buildInventoryScreen(context),
        _buildInventoryGeneralScreen(context),
        _buildGalleryScreen(context),
      ],
    );
  }

  Widget _buildInventoryScreen(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Edit Inventory',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
              color: greyColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: SearchFields(
              controller: sdkController,
              hintText: 'SDK',
              height: 55,
            ),
          ),
        ),
        SizedBox(height: 20),
        ListTile(
          leading: Checkbox(
            value: _checkbox,
            onChanged: (value) {
              setState(() {
                _checkbox = !_checkbox;
              });
            },
          ),
          title: Text(
            'Manage Stock?',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
          ),
          subtitle: Text(
            'Enable Stock management at Product level.',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 25),
          child: ButtonBig(
            fontSize: 14,
            onTap: () {
              // Validate and navigate to the next step
              _pageController.nextPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
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
      ],
    );
  }

  Widget _buildInventoryGeneralScreen(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Inventory General\ninformation',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: greyColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: SearchFields(
                controller: titleController,
                hintText: 'Title',
                height: 55,
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: greyColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: SearchFields(
                controller: requiredPriceController,
                hintText: 'Required Price',
                height: 55,
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: greyColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: SearchFields(
                controller: salePriceController,
                hintText: 'Sale Price (Show to customer)',
                height: 55,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Description',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
            ),
            SizedBox(height: 20),
            TextFormField(
              maxLines: 10,
              controller: descController,
              decoration: InputDecoration(
                hintText: "Description",
                filled: true,
                fillColor: colorLight1,
                hintStyle: TextStyle(color: colorLight3),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: colorLight3, width: 1),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 25),
              child: ButtonBig(
                fontSize: 14,
                onTap: () {
                  // Validate and navigate to the next step
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
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
          ],
        ),
      ),
    );
  }

  Widget _buildGalleryScreen(BuildContext context) {
    return Consumer<AddProductViewModel>(
      builder: (context, value, child) {
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Text(
                    'Add Gallery',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Item Thumbnail',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Implement the logic for uploading the thumbnail
                        },
                        child: Text(
                          'Upload',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: secondaryColorLight,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      value.pickSingleImage();
                    },
                    child: Container(
                      height: 335,
                      width: 350,
                      decoration: BoxDecoration(color: Colors.grey[200]),
                      child: Center(
                        child: widget.thumbnail!.isEmpty ||
                                widget.thumbnail == null
                            ? Icon(
                                Icons.image,
                                color: colorLight3,
                              )
                            : value.selectedImage == null
                                ? Image.network(
                                    widget.thumbnail!,
                                    fit: BoxFit.cover,
                                  )
                                : value.selectedImage == null
                                    ? Icon(
                                        Icons.image,
                                        color: colorLight3,
                                      )
                                    : Image.file(
                                        value.selectedImage!,
                                        fit: BoxFit.cover,
                                      ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Item Gallery',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                      ),
                      value.imageList!.isNotEmpty || widget.images!.isNotEmpty
                          ? GestureDetector(
                              onTap: () {
                                value.pickImages();
                              },
                              child: Text(
                                '+ Add More',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: greenColor,
                                    ),
                              ),
                            )
                          : SizedBox(),
                    ],
                  ),
                  SizedBox(height: verticalSpaceSmall),
                  widget.images!.isEmpty || widget.images == null
                      ? GestureDetector(
                          onTap: () {
                            value.pickImages();
                          },
                          child: Container(
                            width: context.deviceWidth,
                            height: context.deviceHeight * .2,
                            margin: EdgeInsets.only(top: verticalSpaceSmall2),
                            decoration: BoxDecoration(
                              border: Border.all(color: colorLight2, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Icon(Icons.upload),
                                ),
                                Text(
                                  "Upload Images",
                                  style: Theme.of(context).textTheme.titleSmall,
                                )
                              ],
                            ),
                          ),
                        )
                      : Expanded(
                          child: GridView.builder(
                            padding:
                                EdgeInsets.only(bottom: verticalSpaceLarge),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 3.0,
                              crossAxisSpacing: 3.0,
                            ),
                            itemCount: value.imageList == null ||
                                    value.imageList!.isEmpty
                                ? widget.images!.length
                                : value.imageList!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    top: verticalSpaceSmall),
                                child: Stack(
                                  children: [
                                    Container(
                                      width: context.deviceWidth,
                                      height: context.deviceHeight * .2,
                                      child: value.imageList!.isEmpty ||
                                              value.imageList == null
                                          ? Image.network(
                                              widget.images![index],
                                              fit: BoxFit.cover,
                                            )
                                          : Image.file(
                                              File(
                                                  value.imageList![index].path),
                                              fit: BoxFit.fill,
                                            ),
                                    ),
                                    value.imageList!.isNotEmpty ||
                                            value.imageList == null
                                        ? Positioned(
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
                                              ),
                                            ),
                                          )
                                        : SizedBox()
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                ],
              ),
            ),
            value.loading
                ? Container(
                    width: context.deviceWidth,
                    height: context.deviceHeight,
                    color: colorLight2.withOpacity(.6),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: verticalSpaceLarge),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                          strokeWidth: 2,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        );
      },
    );
  }
}
