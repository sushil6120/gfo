import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:gfo/ui/globalWidgets/buttonBig.dart';
import 'package:gfo/utils/colors.dart';

class SellerDileveryTabbarScreen extends StatefulWidget {
  const SellerDileveryTabbarScreen({super.key});

  @override
  State<SellerDileveryTabbarScreen> createState() =>
      _SellerDileveryTabbarScreenState();
}

class _SellerDileveryTabbarScreenState
    extends State<SellerDileveryTabbarScreen> {
  late ExpandedTileController _controller;

  void initState() {
    // initialize controller
    _controller = ExpandedTileController(isExpanded: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return (Container(
                      child: ExpandedTile(
                        theme: const ExpandedTileThemeData(
                          headerPadding: EdgeInsets.symmetric(vertical: 10),
                          // headerSplashColor: Colors.red,
                          // contentBackgroundColor: Colors.grey,
                          contentPadding: EdgeInsets.all(10.0),
                          contentRadius: 6.0,
                        ),
                        controller: _controller,
                        title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Order ID',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey),
                              ),
                              Text('236085650598',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                            ]),
                        content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total Amount : INR 20,000',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Delivery Date : 20 June 2022',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400)),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Delivery Date : 20 June 2022',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400)),
                              SizedBox(
                                height: 10,
                              ),
                              ButtonBig(
                                fontSize: 14,
                                backgroundColor: secondaryColorLight,
                                backgroundColor2: secondaryColorLight,
                                width: double.infinity,
                                height: 55,
                                text: "Approve",
                                showProgress: false,
                                progressColor: colorLightWhite,
                                progressStrokeWidth: 1.5,
                                radius: 5,
                                textColor: colorLightWhite,
                                letterSpacing: 0,
                                progressPadding: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ]),
                        onTap: () {
                          debugPrint("tapped!!");
                        },
                        onLongTap: () {
                          debugPrint("long tapped!!");
                        },
                      ),
                    ));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
