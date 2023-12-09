import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gfo/ui/globalWidgets/textFormFieldBig.dart';
import 'package:gfo/ui/seller/seller_dilevery_tabbar_screen.dart';
import 'package:gfo/ui/seller/seller_past_tabbar_screen.dart';
import 'package:gfo/ui/seller/seller_upcoming_tabbar_screen.dart';
import 'package:gfo/utils/colors.dart';
import 'package:gfo/utils/routes/routesName.dart';

class SellerOrderScreen extends StatefulWidget {
  const SellerOrderScreen({super.key});

  @override
  State<SellerOrderScreen> createState() => _SellerOrderScreenState();
}

class _SellerOrderScreenState extends State<SellerOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Image.asset('assets/images/sellerprofile.png'),
          elevation: 0,
          title: Text(
            'My Orders',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.sellerNotificationScreen);
                },
                child: Icon(CupertinoIcons.bell,color:colorDark1,)),
            )
          ],
        ),
        // body: Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     SizedBox(
        //       height: 20,
        //     ),
        //     Text('All Suppliers',
        //         style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        //             fontSize: 24,
        //             fontWeight: FontWeight.w700,
        //             color: Colors.black)),
        //     SizedBox(
        //       height: 5,
        //     ),
        //     Text('Total 250 Orders',
        //         style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        //             fontSize: 14,
        //             fontWeight: FontWeight.w400,
        //             color: Colors.black)),
        //     SizedBox(
        //       height: 20,
        //     ),
        //     TextFormFieldBig(
        //       prefixIcon: Icon(
        //         CupertinoIcons.search,
        //         color: colorLight3,
        //       ),
        //       hintText: "Search headphone",
        //       height: 50,
        //       maxlines: 1,
        //       obscureText: false,
        //     ),
        //     DefaultTabController(
        //       length: 3, // Number of tabs
        //       child: Column(
        //         children: [
        //           // TabBar
        //           Container(
        //             color: Colors.blue,
        //             child: TabBar(
        //               tabs: [
        //                 Tab(text: 'Tab 1'),
        //                 Tab(text: 'Tab 2'),
        //                 Tab(text: 'Tab 3'),
        //               ],
        //             ),
        //           ),
        //           // TabBarView
        //           Expanded(
        //             child: TabBarView(
        //               children: [
        //                 // Content for Tab 1
        //                 Center(
        //                   child: Text('Tab 1 Content'),
        //                 ),
        //                 // Content for Tab 2
        //                 Center(
        //                   child: Text('Tab 2 Content'),
        //                 ),
        //                 // Content for Tab 3
        //                 Center(
        //                   child: Text('Tab 3 Content'),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
        body: DefaultTabController(
            length: 3, // Number of tabs
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text('All Suppliers',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.black)),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text('Total 250 Orders',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black)),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
              SizedBox(
                height: 20,
              ),
              // TabBar
              Container(
                child: TabBar(
                  dividerHeight: 0,
                  indicatorColor: primaryColor,
                  labelColor: Colors.green,
                  unselectedLabelColor: Colors.black,
                  labelStyle: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                  tabs: [
                    Tab(text: 'Today’s Deliveries'),
                    Tab(text: 'Upcoming'),
                    Tab(text: 'Past'),
                  ],
                ),
              ),
              // TabBarView
              Expanded(
                child: TabBarView(
                  children: [
                    // Content for Tab 1
                    Center(
                      child: SellerDileveryTabbarScreen(),
                    ),
                    // Content for Tab 2
                    Center(
                      child: SellerUpcomingTabbarScreen(),
                    ),
                    // Content for Tab 3
                    Center(
                      child: SellerPastTabbarScreen(),
                    ),
                  ],
                ),
              ),
            ])));
  }
}
