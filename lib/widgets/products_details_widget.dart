import 'package:flutter/material.dart';
import 'package:gfo/utils/responsive.dart';

import '../utils/colors.dart';
import '../utils/valueConstants.dart';

class ProductDetailsWidget extends StatelessWidget {
  String? desc, desc2, sellerName, location;
   ProductDetailsWidget({super.key, this.desc,this.desc2,this.location, this.sellerName});

  @override
  Widget build(BuildContext context) {
    return     Container(
              width: context.deviceWidth,
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
                      "Highly Detailed ",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: verticalSpaceSmall2,
                      left: 18,
                      right: verticalSpaceLarge,
                    ),
                    child: Text(
                      desc.toString(),
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: verticalSpaceSmall2,
                      left: 18,
                      right: verticalSpaceLarge,
                    ),
                    child: Text(
                     desc2.toString(),
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: verticalSpaceSmall,
                        left: 18,
                        right: verticalSpaceLarge,
                        bottom: verticalSpaceMedium),
                    child: Text(
                      "$sellerName | $location",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 16,
                            color: greenColor.withOpacity(.7),
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                ],
              ),
            );
  }
}