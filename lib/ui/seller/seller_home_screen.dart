import 'package:fl_animated_linechart/fl_animated_linechart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gfo/utils/colors.dart';
import 'package:gfo/utils/routes/routesName.dart';

class SellerHomeScreen extends StatefulWidget {
  const SellerHomeScreen({super.key});

  @override
  State<SellerHomeScreen> createState() => _SellerHomeScreenState();
}

class _SellerHomeScreenState extends State<SellerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        elevation: 0,
        title: Image.asset('assets/images/logo.png'),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: GestureDetector(
              onTap: () {
                if (kDebugMode) {
                  print("working");
                }
                Navigator.pushNamed(context, RoutesName.SellerProfileScreen);
              },
              child: Image.asset('assets/images/sellerprofile.png')),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.sellerNotificationScreen);
              },
              child: Icon(
                CupertinoIcons.bell,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, Andrea',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Your Selling Status &\n Revenue',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 24, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 0),
          //   child: AnimatedLineChart(
          //       lineChart,
          //       toolTipColor: Colors.white,
          //       gridColor: Colors.black54,
          //       textStyle: TextStyle(fontSize: 10, color: Colors.black54),
          //       showMarkerLines:
          //           true, // If this value is not set to true, all defines lines will be filled lines and not dashed
          //       legends: [
          //         Legend(title: 'Critical', color: Colors.red, showLeadingLine: true),
          //         Legend(title: 'Warning', color: Colors.yellow, Icon(Icons.report_problem_rounded, size: 17, color: Colors.yellow)),
          //       ],
          //       legendsRightLandscapeMode: true,
          //     ),
          //   ),
          
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Orders',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'This Month (02 - 28 Aug)',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(fontSize: 11, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: primaryColor.withOpacity(.2),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(children: [
                        Text(
                          '30',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'Total Order',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: primaryColor),
                        ),
                      ]),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: greenColor.withOpacity(.2),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(children: [
                        Text(
                          '10',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'Total Order',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.green),
                        ),
                      ]),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: primaryColor.withOpacity(.45),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(children: [
                        Text(
                          '20',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'Total Order',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: primaryColor),
                        ),
                      ]),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Store Management',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (kDebugMode) {
                              print("working");
                            }
                            Navigator.pushNamed(
                                context, RoutesName.SellerAddInventoryScreen);
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                border: Border.all(color: colorLight3),
                                borderRadius: BorderRadius.circular(50)),
                            child: SvgPicture.asset('assets/add.svg'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Add Product',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (kDebugMode) {
                              print("working");
                            }
                            Navigator.pushNamed(
                                context, RoutesName.SellerOrderScreen);
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                border: Border.all(color: colorLight3),
                                borderRadius: BorderRadius.circular(50)),
                            child: SvgPicture.asset('assets/shopping.svg'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Product',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              border: Border.all(color: colorLight3),
                              borderRadius: BorderRadius.circular(50)),
                          child: SvgPicture.asset('assets/report.svg'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Reports',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // LineChart lineChart = LineChart.fromDateTimeMaps([
  //   line1,
  //   line2,
  //   line3,
  //   line4,
  //   line5
  // ], [
  //   Colors.blue,
  //   Colors.red,
  //   Colors.yellow,
  //   Colors.yellow,
  //   Colors.red
  // ], [
  //   'C',
  //   'C',
  //   'C',
  //   'C',
  //   'C',
  // ], tapTextFontWeight: FontWeight.w400);

  
 
}

