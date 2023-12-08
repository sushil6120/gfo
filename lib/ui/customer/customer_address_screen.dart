import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gfo/utils/responsive.dart';

import '../../utils/colors.dart';
import '../../utils/routes/routesName.dart';
import '../globalWidgets/buttonBig.dart';

class CustomerAddressScreen extends StatefulWidget {
  const CustomerAddressScreen({super.key});

  @override
  State<CustomerAddressScreen> createState() => _CustomerAddressScreenState();
}

class _CustomerAddressScreenState extends State<CustomerAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: colorDark1),
        centerTitle: true,
        title: Text(
          "Shipping Address",
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
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                  return   Container(
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
                          onPressed: () {
                            // Navigator.pushNamed(context, RoutesName.customerAddressScreen);
                          },
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
            );
                },)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 25),
            child: ButtonBig(
              fontSize: 14,
              onTap: () {
                if (kDebugMode) {
                  print("working");
                }
                Navigator.pushNamed(context, RoutesName.customerAddNewAddressScreen);
              },
              backgroundColor: colorLight2,
              backgroundColor2: colorLight2,
              width: double.infinity,
              height: 55,
              text: "+  Add New Address",
              showProgress: false,
              progressColor: colorLightWhite,
              progressStrokeWidth: 1.5,
              radius: 5,
              textColor: colorDark1,
              letterSpacing: 0,
              progressPadding: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 25),
            child: ButtonBig(
              fontSize: 14,
              onTap: () {
                if (kDebugMode) {
                  print("working");
                }
                // Navigator.pushNamed(context, RoutesName.checkOutScreen);
              },
              backgroundColor: greenColor.withOpacity(.6),
              backgroundColor2: greenColor.withOpacity(.6),
              width: double.infinity,
              height: 55,
              text: "Apply",
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
    );
  }
}