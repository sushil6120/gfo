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
            child: Icon(
              CupertinoIcons.bell,
              color: Colors.black,
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
          //   padding: const EdgeInsets.symmetric(horizontal: 20),
          //   child: SizedBox(
          //     height: 300,
          //     child: LineChart(
          //       LineChartData(
          //         // Your chart data configuration goes here
          //         gridData: FlGridData(show: false),
          //         titlesData: FlTitlesData(show: false),
          //         borderData: FlBorderData(
          //           show: true,
          //           border:
          //               Border.all(color: const Color(0xff37434d), width: 1),
          //         ),
          //         minX: 0,
          //         maxX: 7,
          //         minY: 0,
          //         maxY: 6,
          //         lineBarsData: [
          //           LineChartBarData(
          //             spots: [
          //               FlSpot(0, 3),
          //               FlSpot(1, 1),
          //               FlSpot(2, 4),
          //               FlSpot(3, 2),
          //               FlSpot(4, 5),
          //               FlSpot(5, 1),
          //               FlSpot(6, 4),
          //             ],
          //             isCurved: true,
          //             dotData: FlDotData(show: false),
          //             belowBarData: BarAreaData(show: false),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
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
                          color: greenColor.withOpacity(.2),
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
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              border: Border.all(color: colorLight3),
                              borderRadius: BorderRadius.circular(50)),
                          child: SvgPicture.asset('assets/shopping.svg'),
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
}
