import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gfo/response/status.dart';
import 'package:gfo/services/sharedPreferencesServices/sharedPreferences.dart';
import 'package:gfo/utils/responsive.dart';
import 'package:gfo/utils/valueConstants.dart';
import 'package:gfo/viewmodel/addressViewModel.dart';
import 'package:gfo/widgets/circular_progress.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';
import '../../utils/routes/routesName.dart';
import '../globalWidgets/buttonBig.dart';

class CustomerAddressScreen extends StatefulWidget {
  const CustomerAddressScreen({super.key});

  @override
  State<CustomerAddressScreen> createState() => _CustomerAddressScreenState();
}

class _CustomerAddressScreenState extends State<CustomerAddressScreen> {
  SharedPreferencesViewModel sharedPreferencesViewModel =
      SharedPreferencesViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final addressData = Provider.of<AddressViewModel>(context, listen: false);
    Future.wait([sharedPreferencesViewModel.getToken()]).then((value) {
      print(value[0]);
      addressData.getAddressApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: const IconThemeData(color: colorDark1),
        centerTitle: true,
        title: Text(
          "Shipping Address",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: primaryColor, fontWeight: FontWeight.w700, fontSize: 16),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share_outlined,
                color: colorDark2,
              )),
          const SizedBox(
            width: 5,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<AddressViewModel>(
              builder: (context, value, child) {
                switch (value.addressData.status) {
                  case Status.LOADING:
                    return MyCircularProgressWidget();
                  case Status.ERROR:
                    return Center(
                      child: Text(value.addressData.message.toString()),
                    );
                  case Status.COMPLETED:
                    return Stack(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                itemCount: value.address!.addresses!.length,
                                itemBuilder: (context, index) {
                                  var items = value.address!.addresses!.reversed
                                      .toList();
                                  return Container(
                                    width: context.deviceWidth,
                                    margin: const EdgeInsets.only(
                                        left: 18, right: 18, top: 10),
                                    decoration: BoxDecoration(
                                        color: colorLight2.withOpacity(.5),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 18, right: 18, bottom: 2),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(Icons
                                                      .location_on_outlined),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "Home",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium!
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 14),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      // Navigator.pushNamed(context, RoutesName.customerAddressScreen);
                                                    },
                                                    icon: const Icon(
                                                      Icons.edit,
                                                      size: 18,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      value.deleteAddressAPi(
                                                          items[index]
                                                              .sId
                                                              .toString(),
                                                          context);
                                                    },
                                                    icon: const Icon(
                                                      Icons.delete_outline,
                                                      size: 18,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 18, right: 30, bottom: 18),
                                          child: Text(
                                            "${items[index].city} ${items[index].state} ${items[index].pinCode} ${items[index].address} ${items[index].locality}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                    color: colorDark3,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                        value.loading
                            ? Container(
                                width: context.deviceWidth,
                                height: context.deviceHeight,
                                color: colorLight2.withOpacity(.6),
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                      bottom: verticalSpaceLarge),
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: primaryColor,
                                      strokeWidth: 2,
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox()
                      ],
                    );

                  default:
                }
                return Container();
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 25),
              child: ButtonBig(
                fontSize: 14,
                onTap: () {
                  if (kDebugMode) {
                    print("working");
                  }
                  Navigator.pushReplacementNamed(
                      context, RoutesName.customerAddNewAddressScreen);
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
