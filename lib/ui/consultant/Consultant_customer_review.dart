import 'package:flutter/material.dart';
import 'package:gfo/utils/colors.dart';
import 'package:gfo/utils/responsive.dart';
import 'package:gfo/utils/valueConstants.dart';

class ConsultantCoustomerReview extends StatefulWidget {
  const ConsultantCoustomerReview({super.key});

  @override
  State<ConsultantCoustomerReview> createState() =>
      _ConsultantCoustomerReviewState();
}

class _ConsultantCoustomerReviewState extends State<ConsultantCoustomerReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Customer Review',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 6, left: 14, right: verticalSpaceLarge),
            child: Text(
              "Review & feedback",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 24, fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: verticalSpaceSmall2, left: 18, right: verticalSpaceLarge),
            child: Text(
              "10 Reviews by client",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: verticalSpaceMedium,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                    top: verticalSpaceSmall2, bottom: verticalSpaceSmall2),
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: colorLight2,
                            radius: 22,
                            backgroundImage: NetworkImage(
                                "https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                          ),
                          SizedBox(
                            width: verticalSpaceExtraSmall,
                          ),
                          Text(
                            "Madelina",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                        ],
                      ),
                      Text(
                        "1 Month ago",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: 12,
                                  color: colorLight3,
                                  fontWeight: FontWeight.w400,
                                ),
                      ),
                    ],
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.only(left: context.deviceWidth * .12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "⭐⭐⭐⭐",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ]),
      ),
    );
  }
}
