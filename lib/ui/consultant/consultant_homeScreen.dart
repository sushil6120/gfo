import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gfo/utils/colors.dart';
import 'package:gfo/utils/responsive.dart';
import 'package:gfo/utils/routes/routesName.dart';
import 'package:gfo/utils/valueConstants.dart';

// import 'package:flutter_circular_chart/flutter_circular_chart.dart';
//
class ConsultantHomeScreen extends StatefulWidget {
  const ConsultantHomeScreen({super.key});

  @override
  State<ConsultantHomeScreen> createState() => _ConsultantHomeScreenState();
}

class _ConsultantHomeScreenState extends State<ConsultantHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            padding: EdgeInsets.only(top: 25),
            height: 100,
            child: Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.consultantProfileScreen);
                    },
                    child: const CircleAvatar(
                      radius: 18,
                      backgroundImage: NetworkImage(
                          "https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg"),
                    ),
                  ),
                  Image.asset("assets/logo.png"),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.consultantNotificationScreen);
                    },
                    child: const Icon(CupertinoIcons.bell))
                ],
              ),
            ),
          )),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: verticalSpaceSmall2, left: 18, right: verticalSpaceLarge),
            child: Text(
              "Hi, Amit",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 6, left: 14, right: verticalSpaceLarge),
            child: Text(
              "Your Client is Wating",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 24, fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: verticalSpaceMedium, left: 18, right: 18),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: colorLight3.withOpacity(.2)),
                  borderRadius: BorderRadius.circular(5),
                  color: colorDark3.withOpacity(.02)),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: verticalSpaceSmall2, vertical: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(18, 183, 100, .2),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              // decoration: const BoxDecoration(
                              //   image: DecorationImage(
                              //       image: SvgPicture.asset.(""),
                              //       fit: BoxFit.cover),
                              // ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(CupertinoIcons.up_arrow,
                                    color: Color.fromRGBO(18, 183, 100, 1)),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Total Income",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(fontSize: 11)),
                              Text(
                                "INR 45000",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(18, 183, 100, 1)),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(240, 68, 56, .2),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              // decoration: const BoxDecoration(
                              //   image: DecorationImage(
                              //       image: SvgPicture.asset.(""),
                              //       fit: BoxFit.cover),
                              // ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(CupertinoIcons.down_arrow,
                                    color: Color.fromRGBO(240, 68, 56, 1)),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Total Income",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(fontSize: 11)),
                              Text(
                                "INR 25000",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(240, 68, 56, 1)),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          //banner section
          Padding(
            padding: const EdgeInsets.only(
                top: verticalSpaceMedium,
                left: 18,
                right: 18,
                bottom: verticalSpaceSmall),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: colorDark3),
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromRGBO(26, 32, 40, 1)),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: verticalSpaceSmall2, vertical: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(18, 183, 100, .2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          // decoration: const BoxDecoration(
                          //   image: DecorationImage(
                          //       image: SvgPicture.asset.(""),
                          //       fit: BoxFit.cover),
                          // ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(CupertinoIcons.up_arrow,
                                color: Color.fromRGBO(18, 183, 100, 1)),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Congratulation",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700)),
                          Text(
                            "90% People show interests \n in your Profile",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    color: colorLight3),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(65, 73, 85, 1),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          // decoration: const BoxDecoration(
                          //   image: DecorationImage(
                          //       image: SvgPicture.asset.(""),
                          //       fit: BoxFit.cover),
                          // ),
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                "assets/sms-edit.svg",
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) {
              return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.consultantUserInfoScreen);
                    },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                      width: context.deviceWidth * .24,
                      height: context.deviceHeight * .11,
                      margin:
                          EdgeInsets.only(left: 18, bottom: verticalSpaceSmall2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: colorLight2,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStwm8DDAL78_c8iv6IcujjSIY34vT5ok4FtA&usqp=CAU"))),
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
                            width: context.deviceWidth * .3,
                            child: Text(
                              "Amit Kumar",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      fontSize: 16, fontWeight: FontWeight.w700),
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
                            "USD 270",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(170, 170, 170, 1)),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(
                              left: 12,
                              right: verticalSpaceLarge,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.location_on_outlined,
                                    color: Color.fromRGBO(0, 148, 255, 1)),
                                Text(
                                  "Location",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(0, 148, 255, 1)),
                                ),
                              ],
                            )),
                      ],
                    ),
                
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 18),
                      child: Text("13:00"),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      )),
    );
  }
}
