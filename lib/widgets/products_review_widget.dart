import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/valueConstants.dart';

class ProductsDetailsReviewWidgets extends StatelessWidget {
  const ProductsDetailsReviewWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: verticalSpaceMedium,
              left: 18,
              right: verticalSpaceLarge,
            ),
            child: Text(
              "Review (102)",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                    top: verticalSpaceSmall2, bottom: verticalSpaceSmall2),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: colorLight2,
                    backgroundImage: NetworkImage(
                        "https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Madelina",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "⭐⭐⭐⭐",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                      ),
                    ],
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: verticalSpaceSmall),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ),
                  trailing: Text(
                    "1 Month ago",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 12,
                          color: colorLight3,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ),
              );
            },
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                top: verticalSpaceMedium,
                left: 18,
                bottom: verticalSpaceSmall,
                right: verticalSpaceLarge,
              ),
              child: Text(
                "See All Reviews",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: colorDark3
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
