import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gfo/utils/responsive.dart';
import 'package:gfo/utils/valueConstants.dart';

import '../../utils/colors.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: colorDark1),
        centerTitle: true,
        title: Text(
          "Checkout",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: primaryColor, fontWeight: FontWeight.w700, fontSize: 16),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.share_outlined,
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
            Container(
              width: context.deviceWidth,
              margin: EdgeInsets.only(left: 18, right: 18, top: 10),
              decoration: BoxDecoration(
                  color: colorLight2.withOpacity(.5),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 18, right: 18, bottom: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Home",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit,
                            size: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 18, right: 30, bottom: 18),
                    child: Text(
                      "Kochi, Kerala 683503, IN Get directions Ashiana Road HDFC Bank Patna Sadar, Bihar 800014, Office",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: colorDark3,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: verticalSpaceSmall2, left: 18, right: 18),
              child: Divider(
                color: colorLight2.withOpacity(.5),
                thickness: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 18, top: verticalSpaceMedium, bottom: 10),
              child: Text(
                "Order List",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w700, fontSize: 18),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Container(
                      width: context.deviceWidth * .24,
                      height: context.deviceHeight * .12,
                      margin: EdgeInsets.only(
                          left: 18, bottom: verticalSpaceSmall2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: colorLight2,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://sharksindia.com/images/products/Ext/e01.jpg"))),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
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
                              "TMA-2 Comfort Wireless ",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
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
                            "USD 270 ",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 5,
                            left: 14,
                            right: verticalSpaceLarge,
                          ),
                          child: Text(
                            "qty 3 ",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: verticalSpaceSmall2, left: 18, right: 18),
              child: Divider(
                color: searchColor,
                thickness: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 18, top: verticalSpaceSmall2, bottom: 10),
              child: Text(
                "Promo code",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w700, fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).textTheme.headlineMedium!.color!,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                        hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: colorDark3.withOpacity(.8)),
                        hintText: "Proceed to Checkout",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.transparent)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        filled: true,
                        fillColor: searchColor),
                  )),
                  Container(
                    width: context.deviceWidth * .12,
                    height: context.deviceHeight * .06,
                    margin: EdgeInsets.only(left: 16),
                    decoration: BoxDecoration(
                        color: Color(0xff1D2939),
                        borderRadius: BorderRadius.circular(6)),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: colorLightWhite,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
