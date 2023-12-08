import "package:flutter/cupertino.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:gfo/ui/globalWidgets/textFormFieldBig.dart";
import "package:gfo/utils/colors.dart";
import "package:gfo/utils/responsive.dart";
import "package:gfo/utils/routes/routesName.dart";
import "package:gfo/widgets/products_widget.dart";

import "../../utils/valueConstants.dart";
import "../globalWidgets/buttonBig.dart";

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(80), child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: EdgeInsets.only(top: 25),
        height: 100,
        child:  Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 18,
                    backgroundImage: NetworkImage(
                        "https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg"),
                  ),
                  Image.asset("assets/logo.png"),
                  const Icon(CupertinoIcons.bell)
                ],
              ),
            ),
      )),
      body: SingleChildScrollView(
        child: Column(
   
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: verticalSpaceMedium,
                  left: 18,
                  right: verticalSpaceLarge),
              child: Text(
                "Hi, Andrea",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(
                        fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: verticalSpaceSmall2,
                  left: 14,
                  right: verticalSpaceLarge),
              child: Text(
                "What are you looking for today?",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(
                        fontSize: 24, fontWeight: FontWeight.w700),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                  left: 18, right: 18, top: verticalSpaceMedium),
              child: TextFormFieldBig(
                prefixIcon: Icon(
                  CupertinoIcons.search,
                  color: colorLight3,
                ),
                hintText: "Search headphone",
                height: 50,
                maxlines: 1,
                obscureText: false,
              ),
            ),
            Container(
              width: context.deviceWidth,
           
              decoration: const BoxDecoration(
                  color: searchColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: verticalSpaceSmall,
                  ),
                  SizedBox(
                    height: context.deviceHeight * .15,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              width: context.deviceWidth * .82,
                              height: context.deviceHeight * .13,
                              margin: EdgeInsets.only(left: 18),
                              decoration: BoxDecoration(
                                  color: colorLightWhite,
                                  borderRadius:
                                      BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 4,
                                        color:
                                            colorDark3.withOpacity(.2),
                                        spreadRadius: 0,
                                        offset: const Offset(0, 0))
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 18),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets
                                              .only(
                                              top: verticalSpaceMedium,
                                              left: 18,
                                              right:
                                                  verticalSpaceLarge),
                                          child: Text(
                                            "Apply For NOC",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight
                                                            .w700),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets
                                              .only(
                                              top: verticalSpaceSmall,
                                              left: 18,
                                              right:
                                                  verticalSpaceLarge),
                                          child: Text(
                                            "Apply now ->",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w700,
                                                    color: greenColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Image.asset("assets/banner.png")
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 18),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: ButtonBig(
                            fontSize: 14,
                            onTap: () {
                              if (kDebugMode) {
                                print("working");
                              }
                              // Navigator.pushNamed(context, RoutesName.loginOtpVerify);
                            },
                            backgroundColor: primaryColor,
                            backgroundColor2: primaryColor,
                            width: double.infinity,
                            height: 55,
                            text: "Apply For Fire NOC",
                            showProgress: false,
                            progressColor: colorLightWhite,
                            progressStrokeWidth: 1.5,
                            radius: 10,
                            textColor: colorLightWhite,
                            letterSpacing: 0,
                            progressPadding: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          flex: 1,
                          child: ButtonBig(
                            fontSize: 14,
                            onTap: () {
                              if (kDebugMode) {
                                print("working");
                              }
                              // Navigator.pushNamed(context, RoutesName.loginOtpVerify);
                            },
                            backgroundColor: primaryColor,
                            backgroundColor2: primaryColor,
                            width: double.infinity,
                            height: 55,
                            text: "Hire Consultant",
                            showProgress: false,
                            progressColor: colorLightWhite,
                            progressStrokeWidth: 1.5,
                            radius: 10,
                            textColor: colorLightWhite,
                            letterSpacing: 0,
                            progressPadding: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8, left: 14, right: verticalSpaceLarge),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Top Products",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, RoutesName.customerAllProductScreen);
                          },
                          child: Text(
                            "See All",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: colorDark3),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: context.deviceHeight * .29,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, RoutesName.customerProductDetailsScreen);
                          },
                          child: ProductsWidgets(
                            img:
                                "https://thesvgroup.in/images/img/fire-equipments.jpg",
                            title: "TMA-2 HD Wireless",
                            price: "USD 25",
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: context.deviceHeight*.1,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
