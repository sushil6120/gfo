// ignore_for_file: depend_on_referenced_packages

// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gfo/response/status.dart';
import 'package:gfo/utils/colors.dart';
import 'package:gfo/utils/responsive.dart';
import 'package:gfo/utils/valueConstants.dart';
import 'package:gfo/widgets/circular_progress.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:provider/provider.dart';

import '../../services/sharedPreferencesServices/sharedPreferences.dart';
import '../../viewmodel/consultantViewmodel.dart';
import '../globalWidgets/buttonBig.dart';

// ignore: must_be_immutable
class ConsultantInfoScreen extends StatefulWidget {
  Map<String, dynamic>? arguments;
  ConsultantInfoScreen({super.key, this.arguments});

  @override
  State<ConsultantInfoScreen> createState() => _ConsultantInfoScreenState();
}

class _ConsultantInfoScreenState extends State<ConsultantInfoScreen> {
  SharedPreferencesViewModel sharedPreferencesViewModel =
      SharedPreferencesViewModel();
  String? date, month, year;
  String? id;
  String? token;
  String? userId;
  void initState() {
    // TODO: implement initState
    super.initState();
    id = widget.arguments!['id'];
    final consultantData =
        Provider.of<CosultantViewModel>(context, listen: false);
    Future.wait([
      sharedPreferencesViewModel.getToken(),
      sharedPreferencesViewModel.getUserId()
    ]).then((value) {
      print(value);
      token = value[0];
      userId = value[1];
      print(value[1]);

      consultantData.singleConsultantApis(id.toString(), token);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CosultantViewModel>(
      builder: (context, value, child) {
        switch (value.consultantData.status) {
          case Status.LOADING:
            return MyCircularProgressWidget();
          case Status.ERROR:
            return Center(
              child: Text(value.consultantData.message.toString()),
            );
          case Status.COMPLETED:
            return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                iconTheme: IconThemeData(color: colorDark1),
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: context.deviceWidth,
                      height: context.deviceHeight * .5,
                      decoration: BoxDecoration(
                          color: colorLight2,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(value
                                  .singleConsultantModel!.data
                                  .toString()))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: verticalSpaceMedium,
                        left: 18,
                        right: verticalSpaceLarge,
                      ),
                      child: Text(
                        value.singleConsultantModel!.data!.name.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: verticalSpaceExtraSmall,
                        left: 18,
                        right: verticalSpaceLarge,
                      ),
                      child: Text(
                        "Location: ${value.singleConsultantModel!.data!.address}",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: colorDark3),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: verticalSpaceExtraSmall,
                        left: 18,
                        right: verticalSpaceLarge,
                      ),
                      child: Text(
                        "₹ ${value.singleConsultantModel!.data!.consultantFee}",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: greenColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: verticalSpaceExtraSmall,
                        left: 18,
                        right: verticalSpaceLarge,
                      ),
                      child: Text(
                        "dr. Gilang is one of the best doctors in the Persahabatan Hospital. He has saved more than 1000 patients in the past 3 years. He has also received many awards from domestic and abroad as the best doctors. He is available on a private or schedule. ",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: colorLight3),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customRow("Experience",
                            "${value.singleConsultantModel!.data!.experience}"),
                        Container(
                          width: 1,
                          height: 50,
                          margin: EdgeInsets.only(top: 30),
                          color: colorLight3,
                        ),
                        customRow("Patient", "1221"),
                        Container(
                          width: 1,
                          height: 50,
                          margin: EdgeInsets.only(top: 30),
                          color: colorLight3,
                        ),
                        customRow("Rating", "5.0"),
                      ],
                    ),
                    SizedBox(
                      height: verticalSpaceLarge,
                    )
                  ],
                ),
              ),
              bottomNavigationBar: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 25),
                    child: ButtonBig(
                      fontSize: 14,
                      onTap: () {
                        if (kDebugMode) {
                          print("working");
                        }
                        // Navigator.pushNamed(context, RoutesName.checkOutScreen);
                      },
                      backgroundColor: colorDark3.withOpacity(.6),
                      backgroundColor2: colorDark3.withOpacity(.6),
                      width: context.deviceWidth * .16,
                      height: 55,
                      text: "Chat",
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
                  date == null ||
                          month == null ||
                          year == null ||
                          date!.isEmpty ||
                          year!.isEmpty ||
                          month!.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 25),
                          child: ButtonBig(
                            fontSize: 14,
                            onTap: () async {
                              if (kDebugMode) {
                                print("working");
                              }
                              DateTime? dateTime = await showOmniDateTimePicker(
                                theme: ThemeData.light(),
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1600)
                                    .subtract(const Duration(days: 3652)),
                                lastDate: DateTime.now().add(
                                  const Duration(days: 3652),
                                ),
                                is24HourMode: false,
                                isShowSeconds: false,
                                minutesInterval: 1,
                                secondsInterval: 1,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(16)),
                                constraints: const BoxConstraints(
                                  maxWidth: 350,
                                  maxHeight: 650,
                                ),
                                transitionBuilder:
                                    (context, anim1, anim2, child) {
                                  return FadeTransition(
                                    opacity: anim1.drive(
                                      Tween(
                                        begin: 0,
                                        end: 1,
                                      ),
                                    ),
                                    child: child,
                                  );
                                },
                                transitionDuration:
                                    const Duration(milliseconds: 200),
                                barrierDismissible: true,
                                selectableDayPredicate: (dateTime) {
                                  // Disable 25th Feb 2023
                                  if (dateTime == DateTime(2023, 2, 25)) {
                                    print(dateTime);
                                    return false;
                                  } else {
                                    return true;
                                  }
                                },
                              );
                              if (dateTime != null) {
                                setState(() {
                                  date = dateTime.day.toString();
                                  month = dateTime.month.toString();
                                  year = dateTime.year.toString();
                                });
                              }
                            },
                            backgroundColor: greenColor.withOpacity(.6),
                            backgroundColor2: greenColor.withOpacity(.6),
                            width: context.deviceWidth * .7,
                            height: 55,
                            text: "Make an Appointment",
                            showProgress: false,
                            progressColor: colorLightWhite,
                            progressStrokeWidth: 1.5,
                            radius: 10,
                            textColor: colorLightWhite,
                            letterSpacing: 0,
                            progressPadding: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 25),
                          child: ButtonBig(
                            fontSize: 14,
                            onTap: () async {
                              if (kDebugMode) {
                                print("working");
                              }
                              value.createBookingApi(
                                  userId.toString(),
                                  id,
                                  "$year-$month-$date",
                                  value.singleConsultantModel!.data!
                                      .consultantFee,
                                  token,
                                  context);
                            },
                            backgroundColor: greenColor.withOpacity(.6),
                            backgroundColor2: greenColor.withOpacity(.6),
                            width: context.deviceWidth * .7,
                            height: 55,
                            text: "Book Consultant",
                            showProgress: value.loading,
                            progressColor: colorLightWhite,
                            progressStrokeWidth: 1.5,
                            radius: 10,
                            textColor: colorLightWhite,
                            letterSpacing: 0,
                            progressPadding: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                ],
              ),
            );
          default:
        }
        return Container();
      },
    );
  }

  Widget customRow(String title, String title1) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: verticalSpaceMedium,
                left: 18,
                right: verticalSpaceLarge,
              ),
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
                left: 18,
                right: verticalSpaceLarge,
              ),
              child: Text(
                title1,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: primaryColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
