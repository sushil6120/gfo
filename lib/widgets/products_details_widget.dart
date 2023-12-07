import 'package:flutter/material.dart';
import 'package:gfo/utils/responsive.dart';

import '../utils/colors.dart';
import '../utils/valueConstants.dart';

class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({super.key});

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
                      "The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers.  ",
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
                      "The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers.  ",
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
                      "Seller name | Location Name",
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