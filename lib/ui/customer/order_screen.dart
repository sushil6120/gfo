import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gfo/utils/colors.dart';
import 'package:gfo/utils/responsive.dart';
import 'package:gfo/utils/routes/routesName.dart';

import '../../utils/valueConstants.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: true,
        centerTitle: true,
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: verticalSpaceSmall,
                left: 18,
                right: verticalSpaceLarge,
              ),
              child: Text(
                "Orders",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 28, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 0,
                left: 18,
                right: verticalSpaceLarge,
              ),
              child: Text(
                "History",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: verticalSpaceMedium,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RoutesName.orderInfoScreen);
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    image: NetworkImage(
                                        "https://sharksindia.com/images/products/Ext/e01.jpg"))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 0,
                                    left: 14,
                                    right: verticalSpaceLarge,
                                  ),
                                  child: SizedBox(
                                    width: context.deviceWidth * .6,
                                    child: Text(
                                      "TMA-2 Comfort Wireless ",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              fontSize: 14,
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
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 5,
                                    left: 14,
                                    right: verticalSpaceLarge,
                                  ),
                                  child: Text(
                                    "Delivered by : 14 May  ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                          ),
                           Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 16,
                                        color: colorDark3,
                                      )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Divider(
                        color: colorLight2,
                      ),
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
