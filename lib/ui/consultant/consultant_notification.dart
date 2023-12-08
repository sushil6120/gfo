import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gfo/utils/responsive.dart';
import 'package:gfo/utils/routes/routesName.dart';

import '../../utils/colors.dart';
import '../../utils/valueConstants.dart';
import '../globalWidgets/textFormFieldBig.dart';

class ConsultantNotificationScreen extends StatefulWidget {
  const ConsultantNotificationScreen({super.key});

  @override
  State<ConsultantNotificationScreen> createState() => _HistoryMessagesScreenState();
}

class _HistoryMessagesScreenState extends State<ConsultantNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          "Notification",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        iconTheme: const IconThemeData(color: colorDark1),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            shrinkWrap: true,
            itemCount: 20,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.chatScreen);
                    },
                    leading: Container(
                      width: context.deviceWidth * .1,
                      height: context.deviceHeight * .05,
                      decoration: BoxDecoration(
                          color: greenColor.withOpacity(.4),
                          shape: BoxShape.circle),
                      child: Center(
                        child: Icon(
                          Icons.discount_outlined,
                          color: colorLightWhite,
                        ),
                      ),
                    ),
                    title: Text(
                      "Metal Exchange",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit,",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 11, fontWeight: FontWeight.w400),
                    ),
               
                  ),
                  Divider(
                    color: colorLight2,
                    thickness: 1,
                  )
                ],
              );
            },
          ))
        ],
      ),
    );
  }
}
