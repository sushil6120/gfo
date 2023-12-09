import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gfo/utils/responsive.dart';
import 'package:gfo/utils/routes/routesName.dart';

import '../../utils/colors.dart';
import '../../utils/valueConstants.dart';
import '../../widgets/products_details_widget.dart';
import '../../widgets/products_review_widget.dart';
// import '../../widgets/products_widget.dart';

class SellerProductDetailsScreen extends StatefulWidget {
  const SellerProductDetailsScreen({super.key});

  @override
  State<SellerProductDetailsScreen> createState() =>
      _SellerProductDetailsScreenState();
}

class _SellerProductDetailsScreenState
    extends State<SellerProductDetailsScreen> {
  int selectedIndex = 0;
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
            icon: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, RoutesName.sellerNotificationScreen);
              },
              child: const Icon(CupertinoIcons.bell, color: colorDark1)),
          ),
         
        ],
      ),
      body: SingleChildScrollView(
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
                "INR 350",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
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
                "TMA-2\n HD WIRELESS",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 32, fontWeight: FontWeight.w700),
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
                                  fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Container(
                        width: 26,
                        height: 3,
                        margin: const EdgeInsets.only(top: verticalSpaceSmall2),
                        decoration: BoxDecoration(
                            color: selectedIndex == 0
                                ? primaryColor
                                : Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(10)),
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
                                  fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Container(
                        width: 26,
                        height: 3,
                        margin: const EdgeInsets.only(top: verticalSpaceSmall2),
                        decoration: BoxDecoration(
                            color: selectedIndex == 1
                                ? primaryColor
                                : Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(10)),
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
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                physics: const ScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    width: context.deviceWidth * .64,
                    height: context.deviceHeight * .4,
                    margin: const EdgeInsets.only(left: 18, right: 10),
                    decoration: BoxDecoration(
                        color: colorLight2,
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://vadodarahelpline.com/singhania/downloads/A%20Plus%20Fire%20Safety%20PICS.jpg"))),
                  );
                },
              ),
            ),
        selectedIndex == 0 ?ProductDetailsWidget():ProductsDetailsReviewWidgets(),
            Padding(
              padding: const EdgeInsets.only(
                left: 18,
                right: 18,
                top: verticalSpaceMedium,
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}
