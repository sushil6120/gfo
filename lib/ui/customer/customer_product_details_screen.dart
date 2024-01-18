import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gfo/response/status.dart';
import 'package:gfo/services/sharedPreferencesServices/sharedPreferences.dart';
import 'package:gfo/utils/responsive.dart';
import 'package:gfo/viewmodel/cartViewModel.dart';
import 'package:gfo/viewmodel/homeViewModel.dart';
import 'package:gfo/widgets/circular_progress.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';
import '../../utils/routes/routesName.dart';
import '../../utils/valueConstants.dart';
import '../../widgets/products_details_widget.dart';
import '../../widgets/products_review_widget.dart';
import '../../widgets/products_widget.dart';
import '../globalWidgets/buttonBig.dart';

class CustomerProductDetailsScreen extends StatefulWidget {
  Map<String, dynamic>? arguments;
  CustomerProductDetailsScreen({super.key, this.arguments});

  @override
  State<CustomerProductDetailsScreen> createState() =>
      _CustomerProductDetailsScreenState();
}

class _CustomerProductDetailsScreenState
    extends State<CustomerProductDetailsScreen> {
  String? productId;
  String? sellerId;
  String? token;
  int selectedIndex = 0;

  SharedPreferencesViewModel sharedPreferencesViewModel =
      SharedPreferencesViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productId = widget.arguments!['productId'];
    sellerId = widget.arguments!["id"];

    print("productId:" + productId.toString());
    print("productId:" + sellerId.toString());

    final productData = Provider.of<HomeViewModel>(context, listen: false);

    Future.wait([sharedPreferencesViewModel.getToken()]).then((value) {
      print(value[0]);
      token = value[0];

      productData.getProductInfoApi(productId.toString());
      productData.getAnotherProductApi(sellerId.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          automaticallyImplyLeading: true,
          iconTheme: const IconThemeData(color: colorDark1),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.bell, color: colorDark1),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.cart, color: colorDark1),
            ),
          ],
        ),
        body: Consumer<HomeViewModel>(
          builder: (context, value, child) {
            switch (value.allProductData.status) {
              case Status.LOADING:
                return MyCircularProgressWidget();
              case Status.ERROR:
                return Center(
                  child: Text(value.allProductData.message.toString()),
                );
              case Status.COMPLETED:
                if (value.productInfoModel == null ||
                    value.allProductModelClass == null) {
                  return Center(
                    child: MyCircularProgressWidget(),
                  );
                } else if (value.productInfoModel!.data == null ||
                    value.allProductModelClass!.products!.isEmpty) {
                  return Center(
                    child: Text("Nu Product Found!"),
                  );
                } else {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: verticalSpaceMedium,
                            left: 18,
                            right: verticalSpaceLarge,
                          ),
                          child: Text(
                            "₹ ${value.productInfoModel!.data!.salePrice.toString()}",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: primaryColor),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: verticalSpaceSmall2,
                            left: 14,
                            right: verticalSpaceLarge,
                          ),
                          child: Text(
                            value.productInfoModel!.data!.title.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontSize: 32, fontWeight: FontWeight.w700),
                          ),
                        ),
                        const SizedBox(
                          height: verticalSpaceMedium,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 18, right: 18, bottom: verticalSpaceMedium),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = 0;
                                      });
                                    },
                                    child: Text(
                                      "Specification",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Container(
                                    width: 26,
                                    height: 3,
                                    margin: const EdgeInsets.only(
                                        top: verticalSpaceSmall2),
                                    decoration: BoxDecoration(
                                        color: selectedIndex == 0
                                            ? primaryColor
                                            : Theme.of(context)
                                                .scaffoldBackgroundColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: verticalSpaceMedium,
                              ),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = 1;
                                      });
                                    },
                                    child: Text(
                                      "Reviews",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Container(
                                    width: 26,
                                    height: 3,
                                    margin: const EdgeInsets.only(
                                        top: verticalSpaceSmall2),
                                    decoration: BoxDecoration(
                                        color: selectedIndex == 1
                                            ? primaryColor
                                            : Theme.of(context)
                                                .scaffoldBackgroundColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: context.deviceHeight * .4,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount:
                                value.productInfoModel!.data!.images!.length,
                            scrollDirection: Axis.horizontal,
                            physics: const ScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container(
                                width: context.deviceWidth * .64,
                                height: context.deviceHeight * .4,
                                margin:
                                    const EdgeInsets.only(left: 18, right: 10),
                                decoration: BoxDecoration(
                                    color: colorLight2,
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(value
                                            .productInfoModel!
                                            .data!
                                            .images![index]))),
                              );
                            },
                          ),
                        ),
                        selectedIndex == 0
                            ? ProductDetailsWidget(
                                desc: value.productInfoModel!.data!.description,
                                desc2:
                                    value.productInfoModel!.data!.description,
                                location: "Location",
                                sellerName: "SellerName",
                              )
                            : const ProductsDetailsReviewWidgets(),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 18,
                            right: 18,
                            top: verticalSpaceMedium,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Another Product",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                              Text(
                                "See All",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: context.deviceHeight * .29,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount:
                                value.allProductModelClass!.products!.length,
                            scrollDirection: Axis.horizontal,
                            physics: const ScrollPhysics(),
                            itemBuilder: (context, index) {
                              var items =
                                  value.allProductModelClass!.products![index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context,
                                      RoutesName.customerProductDetailsScreen,
                                      arguments: {
                                        "id": items.postedBy.toString(),
                                        "productId": items.sId,
                                      });
                                },
                                child: ProductsWidgets(
                                  img: items.thumbnail == null ||
                                          items.thumbnail!.isEmpty
                                      ? "https://cdn5.vectorstock.com/i/1000x1000/38/19/product-promotion-black-icon-concept-vector-29963819.jpg"
                                      : items.thumbnail,
                                  title: items.title,
                                  price: "₹ ${items.salePrice}",
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: verticalSpaceMedium,
                        )
                      ],
                    ),
                  );
                }
              default:
            }
            return Container();
          },
        ),
        bottomNavigationBar: Consumer<CartViewModel>(
          builder: (context, value, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 25),
              child: ButtonBig(
                fontSize: 14,
                onTap: () {
                  if (kDebugMode) {
                    print("working");
                  }
                  value.addTocartApi(productId.toString(), 1, token, context);
                },
                backgroundColor: primaryColor,
                backgroundColor2: primaryColor,
                width: double.infinity,
                height: 55,
                text: "Add To Cart",
                showProgress: value.loading,
                progressColor: colorLightWhite,
                progressStrokeWidth: 1.5,
                radius: 5,
                textColor: colorLightWhite,
                letterSpacing: 0,
                progressPadding: 20,
                fontWeight: FontWeight.w700,
              ),
            );
          },
        ));
  }
}
