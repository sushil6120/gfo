import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gfo/utils/routes/routesName.dart';

import '../../utils/colors.dart';
import '../../utils/valueConstants.dart';
import '../globalWidgets/textFormFieldBig.dart';

class ConsultantChatListScreen extends StatefulWidget {
  const ConsultantChatListScreen({super.key});

  @override
  State<ConsultantChatListScreen> createState() => _ConsultantChatListScreenState();
}

class _ConsultantChatListScreenState extends State<ConsultantChatListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: true,
        title: Text(
          "Messages",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        iconTheme: const IconThemeData(color: colorDark1),
        actions: [
          IconButton(
            onPressed: () {},
            icon: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.consultantNotificationScreen);
              },
              child: const Icon(CupertinoIcons.bell, color: colorDark1)),
          ),

        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(
                left: 18,
                right: 18,
                top: verticalSpaceSmall2,
                bottom: verticalSpaceMedium),
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
          Expanded(child: ListView.builder(
            shrinkWrap: true,
            itemCount: 20,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.consultantChatMassageScreen);
                    },
                    leading: CircleAvatar(
                      backgroundColor: colorLight2,
                      backgroundImage: NetworkImage(
                          "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg"),
                      radius: 25,
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
                    trailing: Text(
                      "10 min",
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
