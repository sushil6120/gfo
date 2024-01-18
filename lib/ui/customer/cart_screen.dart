// import 'package:cart_stepper/cart_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gfo/response/status.dart';
import 'package:gfo/utils/colors.dart';
import 'package:gfo/utils/demoData.dart';
import 'package:gfo/utils/responsive.dart';
import 'package:gfo/viewmodel/cartViewModel.dart';
import 'package:gfo/widgets/circular_progress.dart';
import 'package:provider/provider.dart';

import '../../services/sharedPreferencesServices/sharedPreferences.dart';
import '../../utils/routes/routesName.dart';
import '../../utils/valueConstants.dart';
import '../../viewmodel/homeViewModel.dart';
import '../globalWidgets/buttonBig.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  SharedPreferencesViewModel sharedPreferencesViewModel =
      SharedPreferencesViewModel();
  String? token;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final cartProduct = Provider.of<CartViewModel>(context, listen: false);

    Future.wait([sharedPreferencesViewModel.getToken()]).then((value) {
      print(value[0]);

      token = value[0];

      cartProduct.getCartApi(token.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            "Shopping Cart",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: primaryColor, fontWeight: FontWeight.w700, fontSize: 16),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.delete,
                  color: colorDark2,
                )),
            SizedBox(
              width: 5,
            )
          ],
        ),
        body: Consumer<CartViewModel>(
          builder: (context, value, child) {
            switch (value.addressData.status) {
              case Status.LOADING:
                return MyCircularProgressWidget();

              case Status.ERROR:
                return Center(
                  child: Text(value.addressData.message.toString()),
                );
              case Status.COMPLETED:
                if (value.getCartModel == null) {
                  return MyCircularProgressWidget();
                } else {
                  return Column(
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount: value.getCartModel!.products!.length,
                            itemBuilder: (context, index) {
                              var items = value.getCartModel!.products!.reversed.toList();
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    width: context.deviceWidth * .18,
                                    height: context.deviceHeight * .09,
                                    margin: EdgeInsets.only(
                                        left: 18, bottom: verticalSpaceSmall2),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: colorLight2,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(items[index].productData!.images![0].toString()
                                                ))),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: verticalSpaceSmall2,
                                            left: 14,
                                            right: verticalSpaceLarge,
                                          ),
                                          child: SizedBox(
                                            width: context.deviceWidth * .5,
                                            child: Text(
                                              items[index].productData!.title.toString(),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 5,
                                            left: 14,
                                            right: verticalSpaceLarge,
                                          ),
                                          child: Text(
                                            "₹ ${items[index].productData!.salePrice.toString()}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w700),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 10,
                                              ),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: context.deviceWidth *
                                                        .06,
                                                    height:
                                                        context.deviceHeight *
                                                            .03,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                          color: colorLight3,
                                                        )),
                                                    child: Icon(
                                                      Icons.remove,
                                                      size: 16,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 20),
                                                    child: Text(
                                                      items[index].quantity.toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium!
                                                          .copyWith(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: context.deviceWidth *
                                                        .06,
                                                    height:
                                                        context.deviceHeight *
                                                            .03,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                          color: colorLight3,
                                                        )),
                                                    child: Icon(
                                                      Icons.add,
                                                      size: 16,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: context.deviceWidth * .3,
                                            ),
                                            IconButton(
                                                onPressed: () {},
                                                icon:
                                                    Icon(CupertinoIcons.delete))
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              );
                            },
                          )
                        ],
                      )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Total 2 Items",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "₹ ${value.getCartModel!.totalPrice.toString()}",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 25),
                        child: ButtonBig(
                          fontSize: 14,
                          onTap: () {
                            if (kDebugMode) {
                              print("working");
                            }
                            Navigator.pushNamed(
                                context, RoutesName.checkOutScreen);
                          },
                          backgroundColor: greenColor.withOpacity(.6),
                          backgroundColor2: greenColor.withOpacity(.6),
                          width: double.infinity,
                          height: 55,
                          text: "Proceed to Checkout",
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
                      SizedBox(
                        height: context.deviceHeight * .05,
                      )
                    ],
                  );
                }
              default:
            }
            return Container();
          },
        ));
  }
}
