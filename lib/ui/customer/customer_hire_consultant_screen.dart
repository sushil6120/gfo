import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gfo/utils/responsive.dart';
import 'package:gfo/utils/routes/routesName.dart';

import '../../utils/colors.dart';
import '../../utils/valueConstants.dart';
import '../globalWidgets/textFormFieldBig.dart';

class CustomeHireConsutantScreen extends StatefulWidget {
  const CustomeHireConsutantScreen({super.key});

  @override
  State<CustomeHireConsutantScreen> createState() =>
      _CustomeHireConsutantScreenState();
}

class _CustomeHireConsutantScreenState
    extends State<CustomeHireConsutantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: const IconThemeData(color: colorDark1),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.bell,
                color: colorDark2,
              )),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.cartScreen);
              },
              icon: const Icon(
                CupertinoIcons.cart,
                color: colorDark2,
              )),
          const SizedBox(
            width: 5,
          )
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
                "Top fire consultant",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 2,
                left: 14,
                right: verticalSpaceLarge,
              ),
              child: Text(
                "Find your Consultant",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 24, fontWeight: FontWeight.w700),
              ),
            ),
               const Padding(
              padding: EdgeInsets.only(
                  left: 18, right: 18, top: verticalSpaceMedium, bottom: verticalSpaceMedium),
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
            ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              
              itemCount: 10,
              itemBuilder: (context, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: context.deviceWidth * .22,
                      height: context.deviceHeight * .11,
                      margin: const EdgeInsets.only(
                          left: 18, bottom: verticalSpaceMedium),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: colorLight2,
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/consultant.jpg"))),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 14,
                            right: verticalSpaceLarge,
                          ),
                          child: SizedBox(
                            width: context.deviceWidth * .5,
                            child: Text(
                              "Gilang Segara Bening",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 14,
                            right: verticalSpaceLarge,
                          ),
                          child: SizedBox(
                            width: context.deviceWidth * .5,
                            child: Text(
                              "Work Name: Delhi Mayur ",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      fontSize: 14,
                                      color: colorDark3,
                                      fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 14,
                            top: 6,
                            right: verticalSpaceLarge,
                          ),
                          child: SizedBox(
                            width: context.deviceWidth * .5,
                            child: Text(
                              "USD 350",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      fontSize: 14,
                                      color: greenColor,
                                      fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 14,
                            right: 0,
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: context.deviceWidth * .5,
                                child: Text(
                                  "⭐⭐⭐⭐  (122)",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          fontSize: 10,
                                          color: colorDark3,
                                          fontWeight: FontWeight.w400),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, RoutesName.consultantInfoScreen);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 3),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: greenColor.withOpacity(.2)),
                                  child: Center(
                                    child: Text(
                                      "Open",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              fontSize: 14,
                                              color: greenColor,
                                              fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
